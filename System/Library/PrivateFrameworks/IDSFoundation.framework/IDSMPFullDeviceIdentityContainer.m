@interface IDSMPFullDeviceIdentityContainer
+ (id)_identityWithLegacyFullIdentity:(id)a3 ngmFullDeviceIdentity:(id)a4 ngmVersion:(id)a5 legacyFullIdentitySerializedData:(id)a6 error:(id *)a7;
+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4;
+ (id)identityWithLegacyFullIdentity:(id)a3 ngmFullDeviceIdentity:(id)a4 ngmVersion:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (IDSMPFullDeviceIdentityContainer)initWithFullLegacyIdentity:(id)a3 ngmFullDeviceidentity:(id)a4 ngmVersion:(id)a5 legacyFullIdentitySerializedData:(id)a6;
- (IDSMPFullLegacyIdentity)legacyFullIdentity;
- (IDSNGMFullDeviceIdentity)ngmFullDeviceIdentity;
- (NSData)cachedLegacySerializedData;
- (NSNumber)ngmVersion;
- (id)_legacyUnsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5;
- (id)_ngmSynchronouslyUnsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5;
- (id)_ngmUnsealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11;
- (id)_ngmValidateEncryptingAndSigningIdentity:(id)a3 forMessage:(id)a4;
- (id)_paddyUnsealMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByPublicIdentity:(id)a8;
- (id)dataRepresentationWithError:(id *)a3;
- (id)debugDescription;
- (id)description;
- (id)publicIdentityWithError:(id *)a3;
- (id)unsealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11 usingIdentityWithIdentifier:(id)a12;
- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 usingIdentityWithIdentifier:(id)a5 error:(id *)a6;
- (unint64_t)hash;
- (void)setCachedLegacySerializedData:(id)a3;
@end

@implementation IDSMPFullDeviceIdentityContainer

+ (id)identityWithLegacyFullIdentity:(id)a3 ngmFullDeviceIdentity:(id)a4 ngmVersion:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend__identityWithLegacyFullIdentity_ngmFullDeviceIdentity_ngmVersion_legacyFullIdentitySerializedData_error_(a1, a2, (uint64_t)a3, v6, a4, a5, 0, a6);
}

+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  v8 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v6, (uint64_t)v5, v7, 0, 0, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = objc_msgSend_accountIdentity(IDSFoundationLog, v9, v10, v11);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      if (a4) {
        v57 = *a4;
      }
      else {
        v57 = 0;
      }
      *(_DWORD *)buf = 138543875;
      v72 = v57;
      __int16 v73 = 2113;
      v74 = v5;
      __int16 v75 = 2113;
      v76 = v8;
      _os_log_fault_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_FAULT, "Failed to deserialize plist - failed to create IDSMPFullDeviceIdentityContainer from data {error: %{public}@, dataRepresentation: %{private}@, dict: %{private}@}", buf, 0x20u);
    }
    goto LABEL_15;
  }
  v14 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"kLegacyFullIdentityKey", v11);
  if (v14)
  {
    v18 = objc_msgSend_identityWithData_error_(IDSMPFullLegacyIdentity, v12, (uint64_t)v14, v15, a4);
    if (!v18)
    {
      v20 = objc_msgSend_accountIdentity(IDSFoundationLog, v16, v17, v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        if (a4) {
          v64 = *a4;
        }
        else {
          v64 = 0;
        }
        *(_DWORD *)buf = 138543875;
        v72 = v64;
        __int16 v73 = 2113;
        v74 = v14;
        __int16 v75 = 2113;
        v76 = v5;
        _os_log_error_impl(&dword_19D9BE000, v20, OS_LOG_TYPE_ERROR, "Failed to deserialize IDSMPFullLegacyIdentity -- failed to create IDSMPFullDeviceIdentityContainer from data {error: %{public}@, legacyData: %{private}@, dataRepresentation: %{private}@}", buf, 0x20u);
      }
      v39 = 0;
      goto LABEL_43;
    }
    v20 = objc_msgSend_objectForKeyedSubscript_(v8, v16, @"kNGMFullDeviceIdentity", v19);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v8, v21, @"kNGMVersion", v22);
    v27 = v23;
    if ((!v20 || v23) && (!v23 || v20))
    {
      if (v20)
      {
        uint64_t v46 = MEMORY[0x19F3AEEF0]();
        id v66 = 0;
        uint64_t v49 = objc_msgSend_identityWithDataRepresentation_error_(IDSNGMFullDeviceIdentity, v47, (uint64_t)v20, v48, &v66);
        id v50 = v66;
        v51 = (void *)v46;
        v32 = v50;
        if (a4 && v32) {
          *a4 = v32;
        }
        if (!v49)
        {
          v36 = objc_msgSend_accountIdentity(IDSFoundationLog, v52, v53, v54);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            if (a4) {
              v65 = *a4;
            }
            else {
              v65 = 0;
            }
            *(_DWORD *)buf = 138543875;
            v72 = v65;
            __int16 v73 = 2113;
            v74 = v20;
            __int16 v75 = 2113;
            v76 = v8;
            _os_log_error_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_ERROR, "Failed to create IDSNGMFullDeviceIdentity from dataRepresentation -- Failed to create IDSMPFullDeviceIdentityContainer {error: %{public}@, ngmData: %{private}@, dict: %{private}@}", buf, 0x20u);
          }
          v39 = 0;
          goto LABEL_41;
        }

        v32 = (void *)v49;
        objc_msgSend__identityWithLegacyFullIdentity_ngmFullDeviceIdentity_ngmVersion_legacyFullIdentitySerializedData_error_(IDSMPFullDeviceIdentityContainer, v55, (uint64_t)v18, v56, v49, v27, v14, a4);
      }
      else
      {
        v32 = 0;
        objc_msgSend__identityWithLegacyFullIdentity_ngmFullDeviceIdentity_ngmVersion_legacyFullIdentitySerializedData_error_(IDSMPFullDeviceIdentityContainer, v24, (uint64_t)v18, v26, 0, v23, v14, a4);
      v58 = };
      v36 = v58;
      if (v58)
      {
        v36 = v58;
        v39 = v36;
      }
      else
      {
        v62 = objc_msgSend_accountIdentity(IDSFoundationLog, v59, v60, v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          sub_19DB753C4((uint64_t *)a4);
        }

        v39 = 0;
      }
    }
    else
    {
      v28 = objc_msgSend_accountIdentity(IDSFoundationLog, v24, v25, v26);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138478339;
        v72 = v8;
        __int16 v73 = 2114;
        v74 = v27;
        __int16 v75 = 2113;
        v76 = v20;
        _os_log_fault_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_FAULT, "Corrupt IDSMPFullDeviceIdentityContainer dataRepresentation, mismatch nullability for kNGMVersion an dkNGMFullDeviceIdentity - Failed to create IDSMPFullDeviceIdentityContainer {dict: %{private}@, ngmVersion: %{public}@, ngmData: %{private}@}", buf, 0x20u);
      }

      if (!a4)
      {
        v39 = 0;
LABEL_42:

LABEL_43:
        goto LABEL_44;
      }
      v31 = @"NO";
      if (!v20) {
        v31 = @"YES";
      }
      v32 = objc_msgSend_stringWithFormat_(NSString, v29, @"Corrupt IDSMPFullDeviceIdentityContainer mismatch nullability for kNGMVersion an dkNGMFullDeviceIdentity {ngmVersion: %@, ngmData==nil: %@}", v30, v27, v31);
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v67 = *MEMORY[0x1E4F28228];
      v68 = v32;
      v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v34, (uint64_t)&v68, v35, &v67, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v33, v37, @"IDSMPIdentityErrorDomain", v38, -1000, v36);
      v39 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_41:

    goto LABEL_42;
  }
  v40 = objc_msgSend_accountIdentity(IDSFoundationLog, v12, v13, v15);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
    sub_19DB75354((uint64_t)v8);
  }

  if (!a4)
  {
LABEL_15:
    v39 = 0;
    goto LABEL_45;
  }
  v43 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v69 = *MEMORY[0x1E4F28228];
  v70 = @"IDSMPFullDeviceIdentityContainer dataRepresentation missing legacyData}";
  v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v41, (uint64_t)&v70, v42, &v69, 1);
  objc_msgSend_errorWithDomain_code_userInfo_(v43, v44, @"IDSMPIdentityErrorDomain", v45, -1000, v18);
  v39 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

LABEL_45:
  return v39;
}

+ (id)_identityWithLegacyFullIdentity:(id)a3 ngmFullDeviceIdentity:(id)a4 ngmVersion:(id)a5 legacyFullIdentitySerializedData:(id)a6 error:(id *)a7
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v17 = a6;
  if (v12)
  {
    if (!v13 || v14)
    {
      if (!v13 && v14) {
        objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v15, *MEMORY[0x1E4F1C3B8], v18, @"Creating a IDSMPFullDeviceIdentityContainer with a non-nil ngmVersion requires a non-nill IDSNGMFullDeviceIdentity");
      }
    }
    else
    {
      objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v15, *MEMORY[0x1E4F1C3B8], v18, @"Creating a IDSMPFullDeviceIdentityContainer with a non-nil IDSNGMFullDeviceIdentity requires a non-nil ngmVersion");
    }
    id v26 = objc_alloc((Class)a1);
    a7 = (id *)objc_msgSend_initWithFullLegacyIdentity_ngmFullDeviceidentity_ngmVersion_legacyFullIdentitySerializedData_(v26, v27, (uint64_t)v12, v28, v13, v14, v17);
  }
  else
  {
    double v19 = objc_msgSend_accountIdentity(IDSFoundationLog, v15, v16, v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_19DB75444();
    }

    if (a7)
    {
      double v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28228];
      v31[0] = @"Failed to create IDSMPFullDeviceIdentityContainer becuase we are missing the legacyFullIdentity";
      uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v31, v21, &v30, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v22, v24, @"IDSMPIdentityErrorDomain", v25, -1000, v23);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      a7 = 0;
    }
  }

  return a7;
}

- (IDSMPFullDeviceIdentityContainer)initWithFullLegacyIdentity:(id)a3 ngmFullDeviceidentity:(id)a4 ngmVersion:(id)a5 legacyFullIdentitySerializedData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSMPFullDeviceIdentityContainer;
  double v15 = [(IDSMPFullDeviceIdentityContainer *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_legacyFullIdentity, a3);
    objc_storeStrong((id *)&v16->_ngmFullDeviceIdentity, a4);
    objc_storeStrong((id *)&v16->_ngmVersion, a5);
    objc_storeStrong((id *)&v16->_cachedLegacySerializedData, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v9 = objc_msgSend_ngmVersion(self, v6, v7, v8);
    if (v9
      && (id v13 = (void *)v9,
          objc_msgSend_ngmFullDeviceIdentity(self, v10, v11, v12),
          id v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      uint64_t v15 = objc_msgSend_ngmVersion(v5, v10, v11, v12);
      if (!v15
        || (double v19 = (void *)v15,
            objc_msgSend_ngmFullDeviceIdentity(v5, v16, v17, v18),
            v20 = objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            !v20))
      {
        char isEqual = 0;
        goto LABEL_13;
      }
      v24 = objc_msgSend_legacyFullIdentity(self, v21, v22, v23);
      double v28 = objc_msgSend_legacyFullIdentity(v5, v25, v26, v27);
      if (objc_msgSend_isEqual_(v24, v29, (uint64_t)v28, v30))
      {
        v34 = objc_msgSend_ngmVersion(self, v31, v32, v33);
        double v38 = objc_msgSend_ngmVersion(v5, v35, v36, v37);
        if (objc_msgSend_isEqual_(v34, v39, (uint64_t)v38, v40))
        {
          v44 = objc_msgSend_ngmFullDeviceIdentity(self, v41, v42, v43);
          double v48 = objc_msgSend_ngmFullDeviceIdentity(v5, v45, v46, v47);
          char isEqual = objc_msgSend_isEqual_(v44, v49, (uint64_t)v48, v50);
        }
        else
        {
          char isEqual = 0;
        }
      }
      else
      {
        char isEqual = 0;
      }
    }
    else
    {
      v24 = objc_msgSend_legacyFullIdentity(self, v10, v11, v12);
      double v28 = objc_msgSend_legacyFullIdentity(v5, v52, v53, v54);
      char isEqual = objc_msgSend_isEqual_(v24, v55, (uint64_t)v28, v56);
    }

LABEL_13:
    goto LABEL_14;
  }
  char isEqual = 0;
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_legacyFullIdentity(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  id v13 = objc_msgSend_ngmVersion(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16);
  double v21 = objc_msgSend_ngmFullDeviceIdentity(self, v18, v19, v20);
  unint64_t v25 = v9 ^ v17 ^ objc_msgSend_hash(v21, v22, v23, v24) ^ 0x11;

  return v25;
}

- (id)publicIdentityWithError:(id *)a3
{
  double v6 = objc_msgSend_legacyFullIdentity(self, a2, (uint64_t)a3, v3);
  id v31 = 0;
  uint64_t v9 = objc_msgSend_publicIdentityWithError_(v6, v7, (uint64_t)&v31, v8);
  id v10 = v31;

  if (v9)
  {
    id v14 = objc_msgSend_ngmFullDeviceIdentity(self, v11, v12, v13);

    if (!v14)
    {
LABEL_5:
      uint64_t v22 = objc_msgSend_ngmVersion(self, v15, v16, v17);
      unint64_t v25 = objc_msgSend_identityWithLegacyPublicIdentity_ngmPublicDeviceIdentity_ngmVersion_error_(IDSMPPublicDeviceIdentityContainer, v23, (uint64_t)v9, v24, v14, v22, a3);

      goto LABEL_17;
    }
    double v18 = objc_msgSend_ngmFullDeviceIdentity(self, v15, v16, v17);
    id v30 = v10;
    id v14 = objc_msgSend_publicDeviceIdentityWithError_(v18, v19, (uint64_t)&v30, v20);
    id v21 = v30;

    if (v14)
    {
      id v10 = v21;
      goto LABEL_5;
    }
    double v28 = objc_msgSend_accountIdentity(IDSFoundationLog, v15, v16, v17);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_19DB75544();
    }

    if (a3)
    {
      double v27 = v21;
      goto LABEL_14;
    }
    unint64_t v25 = 0;
    id v10 = v21;
  }
  else
  {
    uint64_t v26 = objc_msgSend_accountIdentity(IDSFoundationLog, v11, v12, v13);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_19DB754B8();
    }

    if (a3)
    {
      double v27 = v10;
LABEL_14:
      id v10 = v27;
      unint64_t v25 = 0;
      *a3 = v10;
      goto LABEL_17;
    }
    unint64_t v25 = 0;
  }
LABEL_17:

  return v25;
}

- (id)dataRepresentationWithError:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  cachedLegacySerializedData = self->_cachedLegacySerializedData;
  if (cachedLegacySerializedData)
  {
    id v10 = cachedLegacySerializedData;
    objc_msgSend_setObject_forKeyedSubscript_(v7, v11, (uint64_t)v10, v12, @"kLegacyFullIdentityKey");
  }
  else
  {
    uint64_t v16 = objc_msgSend_legacyFullIdentity(self, v5, v6, v8);
    id v10 = objc_msgSend_dataRepresentationWithError_(v16, v17, (uint64_t)a3, v18);

    objc_storeStrong((id *)&self->_cachedLegacySerializedData, v10);
    if (!v10)
    {
      id v10 = objc_msgSend_accountIdentity(IDSFoundationLog, v19, v20, v21);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_19DB755D0((uint64_t *)a3);
      }
      goto LABEL_19;
    }
    objc_msgSend_setObject_forKeyedSubscript_(v7, v19, (uint64_t)v10, v21, @"kLegacyFullIdentityKey");
  }
  uint64_t v22 = objc_msgSend_ngmFullDeviceIdentity(self, v13, v14, v15);
  if (!v22) {
    goto LABEL_9;
  }
  uint64_t v26 = (void *)v22;
  double v27 = objc_msgSend_ngmVersion(self, v23, v24, v25);

  if (!v27) {
    goto LABEL_9;
  }
  v29 = objc_msgSend_ngmFullDeviceIdentity(self, v23, v28, v25);
  uint64_t v32 = objc_msgSend_dataRepresentationWithError_(v29, v30, (uint64_t)a3, v31);

  if (!v32)
  {
    uint64_t v49 = objc_msgSend_accountIdentity(IDSFoundationLog, v33, v34, v35);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_19DB75650((uint64_t *)a3);
    }

LABEL_19:
    uint64_t v46 = 0;
    goto LABEL_20;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v7, v33, (uint64_t)v32, v35, @"kNGMFullDeviceIdentity");
  v39 = objc_msgSend_ngmVersion(self, v36, v37, v38);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v40, (uint64_t)v39, v41, @"kNGMVersion");

LABEL_9:
  uint64_t v42 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v23, (uint64_t)v7, v25, 200, 0, a3);
  uint64_t v46 = v42;
  if (v42)
  {
    id v47 = v42;
  }
  else
  {
    double v48 = objc_msgSend_accountIdentity(IDSFoundationLog, v43, v44, v45);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      if (a3) {
        id v51 = *a3;
      }
      else {
        id v51 = 0;
      }
      int v52 = 138543875;
      id v53 = v51;
      __int16 v54 = 2113;
      id v55 = v7;
      __int16 v56 = 2113;
      v57 = self;
      _os_log_fault_impl(&dword_19D9BE000, v48, OS_LOG_TYPE_FAULT, "Failed to create plist - failed to serialize IDSMPFullDeviceIdentityContainer {error: %{public}@, dict: %{private}@, container: %{private}@}", (uint8_t *)&v52, 0x20u);
    }
  }
LABEL_20:

  return v46;
}

- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 usingIdentityWithIdentifier:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v15 = a5;
  if (v15)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, v30, self, @"IDSMPDeviceIdentityContainer.m", 216, @"Invalid parameter not satisfying: %@", @"identityIdentifier");

    if (v12) {
      goto LABEL_3;
    }
  }
  double v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v16);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, v33, self, @"IDSMPDeviceIdentityContainer.m", 217, @"Invalid parameter not satisfying: %@", @"signingIdentityContainer");

LABEL_3:
  if (objc_msgSend_isEqualToString_(v15, v13, @"pair", v16))
  {
    uint64_t v19 = objc_msgSend__legacyUnsealMessage_signedByPublicIdentity_error_(self, v17, (uint64_t)v11, v18, v12, a6);
LABEL_7:
    uint64_t v23 = (void *)v19;
    goto LABEL_11;
  }
  if (objc_msgSend_isEqualToString_(v15, v17, @"pair-ec", v18))
  {
    uint64_t v19 = objc_msgSend__ngmSynchronouslyUnsealMessage_signedByPublicIdentity_error_(self, v20, (uint64_t)v11, v22, v12, a6);
    goto LABEL_7;
  }
  objc_msgSend_accountIdentity(IDSFoundationLog, v20, v21, v22);
  uint64_t v24 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_FAULT)) {
    sub_19DB756D0(self, v24, v25, v26);
  }

  uint64_t v23 = 0;
LABEL_11:

  return v23;
}

- (id)unsealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11 usingIdentityWithIdentifier:(id)a12
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v84 = a4;
  id v83 = a6;
  id v82 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v24 = a12;
  if (v24)
  {
    if (v21) {
      goto LABEL_3;
    }
  }
  else
  {
    v74 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23, v25);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v74, v75, (uint64_t)a2, v76, self, @"IDSMPDeviceIdentityContainer.m", 238, @"Invalid parameter not satisfying: %@", @"identityIdentifier");

    if (v21) {
      goto LABEL_3;
    }
  }
  uint64_t v77 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23, v25);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v77, v78, (uint64_t)a2, v79, self, @"IDSMPDeviceIdentityContainer.m", 239, @"Invalid parameter not satisfying: %@", @"signingIdentityContainer");

LABEL_3:
  uint64_t v28 = v17;
  if (objc_msgSend_isEqualToString_(v24, v22, @"pair", v25))
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F59E28]);
    id v85 = 0;
    uint64_t v32 = objc_msgSend__legacyUnsealMessage_signedByPublicIdentity_error_(self, v30, (uint64_t)v28, v31, v21, &v85);
    id v34 = v85;
    if (v32)
    {
      uint64_t v36 = [IDSMPDecryptionResult alloc];
      v39 = objc_msgSend_initWithData_encryptedAttributes_withCommitState_additionalDecryptionResult_(v36, v37, (uint64_t)v32, v38, 0, 0, 0);
      objc_msgSend_fulfillWithValue_(v29, v40, (uint64_t)v39, v41);
    }
    else
    {
      objc_msgSend_failWithError_(v29, v33, (uint64_t)v34, v35);
    }
    int v52 = objc_msgSend_promise(v29, v42, v43, v44);

LABEL_11:
    double v50 = v83;
    uint64_t v49 = v84;
    id v51 = v82;
    goto LABEL_12;
  }
  if ((objc_msgSend_isEqualToString_(v24, v26, @"pair-ec", v27) & 1) != 0
    || objc_msgSend_isEqualToString_(v24, v45, @"pair-tetra", v46))
  {
    id v47 = self;
    uint64_t v48 = (uint64_t)v17;
    double v50 = v83;
    uint64_t v49 = v84;
    id v51 = v82;
    int v52 = objc_msgSend__ngmUnsealMessage_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_(v47, v45, v48, v46, v84, a5, v83, v82, v18, v19, v20, v21);
    goto LABEL_12;
  }
  if (!objc_msgSend_isEqualToString_(v24, v45, @"paddy", v46))
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v54, v55, v56);
    uint64_t v58 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_FAULT)) {
      sub_19DB756D0(self, v58, v59, v60);
    }

    id v61 = objc_alloc_init(MEMORY[0x1E4F59E28]);
    v62 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v86 = *MEMORY[0x1E4F28228];
    v87[0] = @"Called unseal without an identifier";
    v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v63, (uint64_t)v87, v64, &v86, 1);
    v68 = objc_msgSend_errorWithDomain_code_userInfo_(v62, v66, @"IDSMPIdentityErrorDomain", v67, -1000, v65);

    objc_msgSend_failWithError_(v61, v69, (uint64_t)v68, v70);
    int v52 = objc_msgSend_promise(v61, v71, v72, v73);

    goto LABEL_11;
  }
  v57 = self;
  id v51 = v82;
  int v52 = objc_msgSend__paddyUnsealMessage_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_(v57, v54, (uint64_t)v17, v56, v82, v18, v19, v20, v21);
  double v50 = v83;
  uint64_t v49 = v84;
LABEL_12:

  return v52;
}

- (id)_ngmValidateEncryptingAndSigningIdentity:(id)a3 forMessage:(id)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = 0x1E596F000uLL;
  id v12 = objc_msgSend_accountIdentity(IDSFoundationLog, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = objc_msgSend_ngmFullDeviceIdentity(self, v13, v14, v15);
    id v20 = objc_msgSend_ngmPublicDeviceIdentity(v6, v17, v18, v19);
    id v21 = NSNumber;
    uint64_t v25 = objc_msgSend_length(v7, v22, v23, v24);
    uint64_t v28 = objc_msgSend_numberWithUnsignedInteger_(v21, v26, v25, v27);
    *(_DWORD *)buf = 138478339;
    v110 = v16;
    __int16 v111 = 2113;
    v112 = v20;
    __int16 v113 = 2113;
    v114 = v28;
    _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "Unsealing message using ngm identities {encryptingIdentity: %{private}@, signingIdentity: %{private}@, message.length: %{private}@}", buf, 0x20u);
  }
  id v34 = objc_msgSend_ngmPublicDeviceIdentity(v6, v29, v30, v31);
  if (v34)
  {
    double v38 = objc_msgSend_ngmFullDeviceIdentity(self, v32, v33, v35);
    if (v38)
    {
      uint64_t v40 = objc_msgSend_ngmVersion(self, v36, v37, v39);
      if (v40)
      {
        double v44 = (void *)v40;
        uint64_t v45 = objc_msgSend_ngmVersion(v6, v41, v42, v43);
        if (v45)
        {
          uint64_t v49 = (void *)v45;
          double v50 = objc_msgSend_ngmVersion(self, v46, v47, v48);
          __int16 v54 = objc_msgSend_ngmVersion(v6, v51, v52, v53);
          if (objc_msgSend_isEqualToNumber_(v50, v55, (uint64_t)v54, v56))
          {

LABEL_15:
            double v60 = 0;
            goto LABEL_24;
          }
          v68 = objc_msgSend_ngmVersion(v6, v57, v58, v59);
          uint64_t v72 = objc_msgSend_intValue(v68, v69, v70, v71);
          char isVersionSupported = objc_msgSend_isVersionSupported_(IDSNGMProtocolVersion, v73, v72, v74);

          unint64_t v8 = 0x1E596F000;
          if (isVersionSupported) {
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      __int16 v75 = NSString;
      double v76 = objc_msgSend_ngmVersion(self, v41, v42, v43);
      v80 = objc_msgSend_ngmVersion(v6, v77, v78, v79);
      double v67 = objc_msgSend_stringWithFormat_(v75, v81, @"Unable to ngm unseal message due to mismatching versions {encryptingIdentity.ngmVersion: %@, signingIdentity.ngmVersion: %@}", v82, v76, v80);

      id v83 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      objc_msgSend_setObject_forKeyedSubscript_(v83, v84, (uint64_t)v67, v85, *MEMORY[0x1E4F28228]);
      v89 = objc_msgSend_ngmVersion(self, v86, v87, v88);

      if (v89)
      {
        v93 = objc_msgSend_ngmVersion(self, v90, v91, v92);
        objc_msgSend_setObject_forKeyedSubscript_(v83, v94, (uint64_t)v93, v95, @"encryptingIdentityNGMVersion");
      }
      v96 = objc_msgSend_ngmVersion(v6, v90, v91, v92);

      if (v96)
      {
        v100 = objc_msgSend_ngmVersion(v6, v97, v98, v99);
        objc_msgSend_setObject_forKeyedSubscript_(v83, v101, (uint64_t)v100, v102, @"signingIdentityNGMVersion");
      }
      double v60 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v97, @"com.apple.ids.IDSDecryptionErrorDomain", v99, 14, v83);
      v106 = objc_msgSend_accountIdentity(*(void **)(v8 + 2896), v103, v104, v105);
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
        sub_19DB75870();
      }
    }
    else
    {
      double v60 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v36, @"com.apple.ids.IDSDecryptionErrorDomain", v39, 13, 0);
      double v67 = objc_msgSend_accountIdentity(IDSFoundationLog, v64, v65, v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        sub_19DB757E4();
      }
    }
  }
  else
  {
    double v60 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v32, @"com.apple.ids.IDSDecryptionErrorDomain", v35, 12, 0);
    double v38 = objc_msgSend_accountIdentity(IDSFoundationLog, v61, v62, v63);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_19DB75758();
    }
  }
LABEL_24:

  return v60;
}

- (id)_ngmSynchronouslyUnsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend__ngmValidateEncryptingAndSigningIdentity_forMessage_(self, v10, (uint64_t)v9, v11, v8);
  double v16 = v12;
  if (v12)
  {
    id v17 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    uint64_t v18 = objc_msgSend_ngmFullDeviceIdentity(self, v13, v14, v15);
    double v22 = objc_msgSend_ngmPublicDeviceIdentity(v9, v19, v20, v21);
    id v32 = 0;
    id v17 = objc_msgSend_unsealMessage_signedByPublicIdentity_error_(v18, v23, (uint64_t)v8, v24, v22, &v32);
    id v25 = v32;

    if (!v17)
    {
      if (v25)
      {
        uint64_t v33 = *MEMORY[0x1E4F28A50];
        v34[0] = v25;
        uint64_t v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v26, (uint64_t)v34, v27, &v33, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v29, @"com.apple.ids.IDSDecryptionErrorDomain", v30, 15, v28);
      }
      else
      {
        uint64_t v28 = 0;
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v26, @"com.apple.ids.IDSDecryptionErrorDomain", v27, 15, 0);
      }
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v17;
}

- (id)_ngmUnsealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v71 = a4;
  id v73 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  double v24 = objc_msgSend__ngmValidateEncryptingAndSigningIdentity_forMessage_(self, v22, (uint64_t)v21, v23, v16);
  id v25 = objc_alloc_init(MEMORY[0x1E4F59E28]);
  uint64_t v28 = v25;
  uint64_t v70 = v16;
  uint64_t v72 = v19;
  if (v24)
  {
    id v29 = v18;
    objc_msgSend_failWithError_(v25, v26, (uint64_t)v24, v27);
    uint64_t v33 = v71;
LABEL_21:
    uint64_t v49 = objc_msgSend_promise(v28, v30, v31, v32);
    goto LABEL_22;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19D9EDF80;
  aBlock[3] = &unk_1E5970998;
  id v64 = v25;
  id v75 = v64;
  double v76 = self;
  id v34 = v21;
  id v77 = v34;
  double v35 = _Block_copy(aBlock);
  if (v17) {
    BOOL v39 = v18 == 0;
  }
  else {
    BOOL v39 = 1;
  }
  BOOL v41 = v39 || v19 == 0 || v20 == 0;
  int v42 = !v41;
  int v67 = v42;
  id v68 = v20;
  double v66 = v35;
  if (v41)
  {
    id v29 = v18;
    double v53 = objc_msgSend_accountIdentity(IDSFoundationLog, v36, v37, v38);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v79 = v17;
      __int16 v80 = 2112;
      id v81 = v18;
      __int16 v82 = 2112;
      id v83 = v19;
      __int16 v84 = 2112;
      id v85 = v20;
      _os_log_error_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_ERROR, "Failed to unseal message - one or more required fields is nil {sendingURI: %@ sendingPushToken: %@ receivingURI: %@ receivingPushToken: %@}", buf, 0x2Au);
    }

    double v56 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v54, @"com.apple.ids.IDSDecryptionErrorDomain", v55, 20, 0);
    objc_msgSend_failWithError_(v64, v57, (uint64_t)v56, v58);

    uint64_t v49 = objc_msgSend_promise(v64, v59, v60, v61);
    uint64_t v33 = v71;
  }
  else
  {
    id v43 = v19;
    double v44 = v35;
    uint64_t v65 = objc_msgSend_ngmFullDeviceIdentity(self, v36, v37, v38);
    double v48 = objc_msgSend_ngmPublicDeviceIdentity(v34, v45, v46, v47);
    double v63 = v44;
    uint64_t v49 = v65;
    uint64_t v50 = (uint64_t)v16;
    uint64_t v33 = v71;
    id v29 = v18;
    objc_msgSend_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock_(v65, v51, v50, v52, v71, a5, v73, v17, v18, v43, v68, v48, v63);

    id v20 = v68;
  }

  if (v67) {
    goto LABEL_21;
  }
LABEL_22:

  return v49;
}

- (id)_legacyUnsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v13 = objc_msgSend_accountIdentity(IDSFoundationLog, v10, v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_msgSend_legacyFullIdentity(self, v14, v15, v16);
    id v21 = objc_msgSend_legacyPublicIdentity(v9, v18, v19, v20);
    double v22 = NSNumber;
    uint64_t v26 = objc_msgSend_length(v8, v23, v24, v25);
    id v29 = objc_msgSend_numberWithUnsignedInteger_(v22, v27, v26, v28);
    *(_DWORD *)buf = 138478339;
    id v72 = v17;
    __int16 v73 = 2113;
    double v74 = v21;
    __int16 v75 = 2113;
    double v76 = v29;
    _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "Unsealing message using legacy identities {encryptingIdentity: %{private}@, signingIdentity: %{private}@, message.length: %{private}@}", buf, 0x20u);
  }
  double v35 = objc_msgSend_legacyPublicIdentity(v9, v30, v31, v32);
  if (v35)
  {
    uint64_t v37 = objc_msgSend_legacyFullIdentity(self, v33, v34, v36);
    BOOL v41 = v37;
    if (v37)
    {
      id v68 = 0;
      int v42 = objc_msgSend_verifyAndExposeData_withSigner_error_(v37, v38, (uint64_t)v8, v40, v35, &v68);
      id v45 = v68;
      if (!v42)
      {
        double v47 = objc_msgSend_accountIdentity(IDSFoundationLog, v43, v44, v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          double v63 = objc_msgSend_debugDescription(self, v48, v49, v50);
          int v67 = objc_msgSend_debugDescription(v9, v64, v65, v66);
          *(_DWORD *)buf = 138543875;
          id v72 = v45;
          __int16 v73 = 2113;
          double v74 = v63;
          __int16 v75 = 2113;
          double v76 = v67;
          _os_log_error_impl(&dword_19D9BE000, v47, OS_LOG_TYPE_ERROR, "MessageProtection failed to decrypt with legacy identities - fail to unseal message {error: %{public}@, encryptingIdentity: %{private}@, signingIdentity:%{private}@}", buf, 0x20u);
        }
        if (a5)
        {
          if (v45)
          {
            uint64_t v69 = *MEMORY[0x1E4F28A50];
            id v70 = v45;
            double v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v51, (uint64_t)&v70, v52, &v69, 1);
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v54, @"com.apple.ids.IDSDecryptionErrorDomain", v55, 11, v53);
          }
          else
          {
            double v53 = 0;
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v51, @"com.apple.ids.IDSDecryptionErrorDomain", v52, 11, 0);
          }
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      double v59 = objc_msgSend_accountIdentity(IDSFoundationLog, v38, v39, v40);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
        sub_19DB75A48();
      }

      if (a5)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v60, @"com.apple.ids.IDSDecryptionErrorDomain", v61, 10, 0);
        int v42 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v42 = 0;
      }
    }
  }
  else
  {
    double v56 = objc_msgSend_accountIdentity(IDSFoundationLog, v33, v34, v36);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
      sub_19DB759BC();
    }

    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v57, @"com.apple.ids.IDSDecryptionErrorDomain", v58, 9, 0);
      int v42 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v42 = 0;
    }
  }

  return v42;
}

- (id)_paddyUnsealMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByPublicIdentity:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  double v22 = objc_msgSend__ngmValidateEncryptingAndSigningIdentity_forMessage_(self, v20, (uint64_t)v19, v21, v14);
  id v23 = objc_alloc_init(MEMORY[0x1E4F59E28]);
  uint64_t v26 = v23;
  if (v22)
  {
    objc_msgSend_failWithError_(v23, v24, (uint64_t)v22, v25);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19D9EE7DC;
    aBlock[3] = &unk_1E59709C0;
    void aBlock[4] = self;
    uint64_t v48 = (uint64_t)v14;
    id v30 = v18;
    id v31 = v17;
    id v32 = v16;
    id v33 = v15;
    id v34 = v19;
    id v50 = v34;
    id v51 = v26;
    double v35 = _Block_copy(aBlock);
    uint64_t v39 = objc_msgSend_ngmFullDeviceIdentity(self, v36, v37, v38);
    id v43 = objc_msgSend_ngmPublicDeviceIdentity(v34, v40, v41, v42);
    objc_msgSend_openPaddyMessage_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock_(v39, v44, v48, v45, v33, v32, v31, v30, v43, v35);

    id v15 = v33;
    id v16 = v32;
    id v17 = v31;
    id v18 = v30;
    id v14 = (id)v48;
  }
  double v46 = objc_msgSend_promise(v26, v27, v28, v29);

  return v46;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v8 = objc_msgSend_legacyFullIdentity(self, v5, v6, v7);
  double v12 = objc_msgSend_ngmFullDeviceIdentity(self, v9, v10, v11);
  id v16 = objc_msgSend_ngmVersion(self, v13, v14, v15);
  id v19 = objc_msgSend_stringWithFormat_(v3, v17, @"<%@: %p legacyFullIdentity: %@, ngmFullDeviceIdentity: %@, ngmVersion: %@>", v18, v4, self, v8, v12, v16);

  return v19;
}

- (id)debugDescription
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v8 = objc_msgSend_legacyFullIdentity(self, v5, v6, v7);
  double v12 = objc_msgSend_debugDescription(v8, v9, v10, v11);
  id v16 = objc_msgSend_ngmFullDeviceIdentity(self, v13, v14, v15);
  double v20 = objc_msgSend_debugDescription(v16, v17, v18, v19);
  uint64_t v24 = objc_msgSend_ngmVersion(self, v21, v22, v23);
  double v27 = objc_msgSend_stringWithFormat_(v3, v25, @"<%@: %p legacyFullIdentity: %@, ngmFullDeviceIdentity: %@, ngmVersion: %@>", v26, v4, self, v12, v20, v24);

  return v27;
}

- (IDSMPFullLegacyIdentity)legacyFullIdentity
{
  return self->_legacyFullIdentity;
}

- (IDSNGMFullDeviceIdentity)ngmFullDeviceIdentity
{
  return self->_ngmFullDeviceIdentity;
}

- (NSNumber)ngmVersion
{
  return self->_ngmVersion;
}

- (NSData)cachedLegacySerializedData
{
  return self->_cachedLegacySerializedData;
}

- (void)setCachedLegacySerializedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLegacySerializedData, 0);
  objc_storeStrong((id *)&self->_ngmVersion, 0);
  objc_storeStrong((id *)&self->_ngmFullDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_legacyFullIdentity, 0);
}

@end