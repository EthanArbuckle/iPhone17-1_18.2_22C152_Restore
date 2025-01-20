@interface IDSMPPublicDeviceIdentityContainer
+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4;
+ (id)identityWithLegacyPublicIdentity:(id)a3 ngmPublicDeviceIdentity:(id)a4 ngmVersion:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 ourSigningIdentity:(id)a5 theirURI:(id)a6 theirPushToken:(id)a7;
- (IDSMPPublicDeviceIdentityContainer)initWithLegacyPublicIdentity:(id)a3 ngmPublicDeviceIdentity:(id)a4 ngmVersion:(id)a5;
- (IDSMPPublicLegacyIdentity)legacyPublicIdentity;
- (IDSNGMPublicDeviceIdentity)ngmPublicDeviceIdentity;
- (NSNumber)ngmVersion;
- (id)_legacySealMessage:(id)a3 signedWithFullIdentity:(id)a4 error:(id *)a5;
- (id)_ngmSealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 withEncryptedAttributes:(id)a13 signedWithFullIdentity:(id)a14 usedIdentityWithIdentifier:(id *)a15 error:(id *)a16 additionalResult:(id *)a17;
- (id)dataRepresentationWithError:(id *)a3;
- (id)debugDescription;
- (id)description;
- (id)legacySealMessage:(id)a3 withEncryptedAttributes:(id)a4 signedByFullIdentity:(id)a5 usingIdentitiesWithIdentifier:(id)a6 error:(id *)a7;
- (id)sealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 withEncryptedAttributes:(id)a13 signedByFullIdentity:(id)a14 usedIdentityWithIdentifier:(id *)a15 error:(id *)a16 additionalResult:(id *)a17;
- (id)sealPaddyMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByFullIdentity:(id)a8 error:(id *)a9;
- (unint64_t)hash;
@end

@implementation IDSMPPublicDeviceIdentityContainer

+ (id)identityWithLegacyPublicIdentity:(id)a3 ngmPublicDeviceIdentity:(id)a4 ngmVersion:(id)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16 = v12;
  if (v10)
  {
    if (!v11 || v12)
    {
      if (!v11 && v12) {
        objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v13, *MEMORY[0x1E4F1C3B8], v15, @"Creating a IDSMPPublicDeviceIdentityContainer with a non-nil ngmVersion requires a non-nill IDSNGMPublicDeviceIdentity");
      }
    }
    else
    {
      objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v13, *MEMORY[0x1E4F1C3B8], v15, @"Creating a IDSMPPublicDeviceIdentityContainer with a non-nil IDSNGMPublicDeviceIdentity requires a non-nil ngmVersion");
    }
    id v24 = objc_alloc((Class)a1);
    a6 = (id *)objc_msgSend_initWithLegacyPublicIdentity_ngmPublicDeviceIdentity_ngmVersion_(v24, v25, (uint64_t)v10, v26, v11, v16);
  }
  else
  {
    v17 = objc_msgSend_accountIdentity(IDSFoundationLog, v13, v14, v15);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_19DB75B78();
    }

    if (a6)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28228];
      v29[0] = @"Failed to create IDSMPPublicDeviceIdentityContainer becuase we are missing the legacyPublicIdentity";
      v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v29, v19, &v28, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v20, v22, @"IDSMPIdentityErrorDomain", v23, -1000, v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
  }

  return a6;
}

- (IDSMPPublicDeviceIdentityContainer)initWithLegacyPublicIdentity:(id)a3 ngmPublicDeviceIdentity:(id)a4 ngmVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSMPPublicDeviceIdentityContainer;
  id v12 = [(IDSMPPublicDeviceIdentityContainer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_legacyPublicIdentity, a3);
    objc_storeStrong((id *)&v13->_ngmPublicDeviceIdentity, a4);
    objc_storeStrong((id *)&v13->_ngmVersion, a5);
  }

  return v13;
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
      && (v13 = (void *)v9,
          objc_msgSend_ngmPublicDeviceIdentity(self, v10, v11, v12),
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      uint64_t v15 = objc_msgSend_ngmVersion(v5, v10, v11, v12);
      if (!v15
        || (double v19 = (void *)v15,
            objc_msgSend_ngmPublicDeviceIdentity(v5, v16, v17, v18),
            v20 = objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            !v20))
      {
        char isEqual = 0;
        goto LABEL_13;
      }
      id v24 = objc_msgSend_legacyPublicIdentity(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_legacyPublicIdentity(v5, v25, v26, v27);
      if (objc_msgSend_isEqual_(v24, v29, (uint64_t)v28, v30))
      {
        v34 = objc_msgSend_ngmVersion(self, v31, v32, v33);
        v38 = objc_msgSend_ngmVersion(v5, v35, v36, v37);
        if (objc_msgSend_isEqual_(v34, v39, (uint64_t)v38, v40))
        {
          v44 = objc_msgSend_ngmPublicDeviceIdentity(self, v41, v42, v43);
          v48 = objc_msgSend_ngmPublicDeviceIdentity(v5, v45, v46, v47);
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
      id v24 = objc_msgSend_legacyPublicIdentity(self, v10, v11, v12);
      uint64_t v28 = objc_msgSend_legacyPublicIdentity(v5, v52, v53, v54);
      char isEqual = objc_msgSend_isEqual_(v24, v55, (uint64_t)v28, v56);
    }

LABEL_13:
    goto LABEL_14;
  }
  char isEqual = 0;
LABEL_14:

  return isEqual;
}

+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x19F3AEEF0]();
  id v81 = 0;
  uint64_t v9 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v7, (uint64_t)v5, v8, 0, 0, &v81);
  id v10 = v81;
  if (a4 && v10) {
    *a4 = v10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = objc_msgSend_accountIdentity(IDSFoundationLog, v11, v12, v13);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      if (a4) {
        id v73 = *a4;
      }
      else {
        id v73 = 0;
      }
      *(_DWORD *)buf = 138543875;
      id v85 = v73;
      __int16 v86 = 2113;
      uint64_t v87 = (uint64_t)v5;
      __int16 v88 = 2113;
      uint64_t v89 = (uint64_t)v9;
      _os_log_fault_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_FAULT, "Failed to deserialize plist - failed to create IDSMPPublicDeviceIdentityContainer from data {error: %{public}@, dataRepresentation: %{private}@, dict: %{private}@}", buf, 0x20u);
    }
    goto LABEL_28;
  }
  v16 = objc_msgSend_objectForKeyedSubscript_(v9, v11, @"kLegacyPublicIdentityKey", v13);
  if (v16)
  {
    v20 = objc_msgSend_identityWithData_error_(IDSMPPublicLegacyIdentity, v14, (uint64_t)v16, v17, a4);
    if (!v20)
    {
      uint64_t v22 = objc_msgSend_accountIdentity(IDSFoundationLog, v18, v19, v21);
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        if (a4) {
          id v75 = *a4;
        }
        else {
          id v75 = 0;
        }
        *(_DWORD *)buf = 138543875;
        id v85 = v75;
        __int16 v86 = 2113;
        uint64_t v87 = (uint64_t)v16;
        __int16 v88 = 2113;
        uint64_t v89 = (uint64_t)v5;
        _os_log_error_impl(&dword_19D9BE000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "Failed to deserialize IDSMPPublicLegacyIdentity -- failed to create IDSMPPublicDeviceIdentityContainer from data {error: %{public}@, legacyData: %{private}@, dataRepresentation: %{private}@}", buf, 0x20u);
      }
      uint64_t v46 = 0;
      goto LABEL_53;
    }
    uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v9, v18, @"kNGMPublicDeviceIdentityDataKey", v21);
    uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v9, v23, @"kNGMPublicDevicePrekeyDataKey", v24);
    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v9, v26, @"kNGMVersion", v27);
    if (v22) {
      BOOL v32 = v25 == 0;
    }
    else {
      BOOL v32 = 1;
    }
    int v33 = !v32;
    if (v28) {
      char v34 = v33;
    }
    else {
      char v34 = 0;
    }
    v80 = (void *)v28;
    if ((v34 & 1) != 0 || !(v22 | v25 | v28))
    {
      v79 = v20;
      if (v33)
      {
        uint64_t v53 = MEMORY[0x19F3AEEF0]();
        uint64_t v54 = v25;
        v55 = (void *)v53;
        uint64_t v56 = v54;
        uint64_t v59 = objc_msgSend_identityWithIdentityData_prekeyData_error_(IDSNGMPublicDeviceIdentity, v57, v22, v58);
        id v60 = 0;
        v64 = v60;
        if (a4 && v60)
        {
          id v65 = v60;
          v64 = v60;
          *a4 = v65;
        }
        v20 = v79;
        if (!v59)
        {
          double v40 = v64;
          double v43 = objc_msgSend_accountIdentity(IDSFoundationLog, v61, v62, v63);
          uint64_t v25 = v56;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            if (a4) {
              id v77 = *a4;
            }
            else {
              id v77 = 0;
            }
            *(_DWORD *)buf = 138544131;
            id v85 = v77;
            __int16 v86 = 2113;
            uint64_t v87 = v22;
            __int16 v88 = 2113;
            uint64_t v89 = v56;
            __int16 v90 = 2113;
            uint64_t v91 = (uint64_t)v9;
            _os_log_error_impl(&dword_19D9BE000, v43, OS_LOG_TYPE_ERROR, "Failed to create IDSNGMFullDeviceIdentity from dataRepresentation -- Failed to create IDSMPFullDeviceIdentityContainer {error: %{public}@, ngmIdentityData: %{private}@, ngmPrekeyData: %{private}@, dict: %{private}@}", buf, 0x2Au);
          }
          uint64_t v46 = 0;
          goto LABEL_51;
        }

        v66 = (void *)v59;
        uint64_t v25 = v56;
      }
      else
      {
        v66 = 0;
      }
      uint64_t v67 = (uint64_t)v20;
      double v40 = v66;
      v68 = objc_msgSend_identityWithLegacyPublicIdentity_ngmPublicDeviceIdentity_ngmVersion_error_(IDSMPPublicDeviceIdentityContainer, v29, v67, v31);
      double v43 = v68;
      if (v68)
      {
        double v43 = v68;
        uint64_t v46 = v43;
      }
      else
      {
        v72 = objc_msgSend_accountIdentity(IDSFoundationLog, v69, v70, v71);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          if (a4) {
            id v76 = *a4;
          }
          else {
            id v76 = 0;
          }
          *(_DWORD *)buf = 138543619;
          id v85 = v76;
          __int16 v86 = 2113;
          uint64_t v87 = (uint64_t)v9;
          _os_log_error_impl(&dword_19D9BE000, v72, OS_LOG_TYPE_ERROR, "Failed to create IDSMPPublicDeviceIdentityContainer from parameters -- Failed to deserialize IDSMPPublicDeviceIdentityContainer {error: %{public}@, dict: %{private}@}", buf, 0x16u);
        }

        uint64_t v46 = 0;
      }
    }
    else
    {
      v35 = objc_msgSend_accountIdentity(IDSFoundationLog, v29, v30, v31);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138478595;
        id v85 = v9;
        __int16 v86 = 2114;
        uint64_t v87 = (uint64_t)v80;
        __int16 v88 = 2113;
        uint64_t v89 = v22;
        __int16 v90 = 2113;
        uint64_t v91 = v25;
        _os_log_fault_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_FAULT, "Corrupt IDSMPPublicDeviceIdentityContainer dataRepresentation, mismatch nullability for kNGMVersion/kNGMPublicDeviceIdentityDataKey/kNGMPublicDevicePrekeyDataKey - Failed to create IDSMPPublicDeviceIdentityContainer {dict: %{private}@, ngmVersion: %{public}@, ngmIdentityData: %{private}@, ngmPrekeyData: %{private}@}", buf, 0x2Au);
      }

      if (!a4)
      {
        uint64_t v46 = 0;
LABEL_52:

LABEL_53:
        goto LABEL_54;
      }
      v79 = v20;
      v38 = @"NO";
      if (v22) {
        v39 = @"NO";
      }
      else {
        v39 = @"YES";
      }
      if (!v25) {
        v38 = @"YES";
      }
      double v40 = objc_msgSend_stringWithFormat_(NSString, v36, @"Corrupt IDSMPPublicDeviceIdentityContainer mismatch nullability for kNGMVersion/kNGMPublicDeviceIdentityDataKey/kNGMPublicDevicePrekeyDataKey {ngmVersion: %@, ngmIdentityData==nil: %@, ngmPrekeyData==nil: %@}", v37, v80, v39, v38);
      v78 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v82 = *MEMORY[0x1E4F28228];
      v83 = v40;
      double v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v41, (uint64_t)&v83, v42, &v82, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v78, v44, @"IDSMPIdentityErrorDomain", v45, -1000, v43);
      uint64_t v46 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_51:

    v20 = v79;
    goto LABEL_52;
  }
  double v47 = objc_msgSend_accountIdentity(IDSFoundationLog, v14, v15, v17);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    sub_19DB75BFC((uint64_t)v9);
  }

  if (!a4)
  {
LABEL_28:
    uint64_t v46 = 0;
    goto LABEL_55;
  }
  double v50 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v92 = *MEMORY[0x1E4F28228];
  v93[0] = @"IDSMPPublicDeviceIdentityContainer dataRepresentation missing legacyData}";
  v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v48, (uint64_t)v93, v49, &v92, 1);
  objc_msgSend_errorWithDomain_code_userInfo_(v50, v51, @"IDSMPIdentityErrorDomain", v52, -1000, v20);
  uint64_t v46 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:

LABEL_55:
  return v46;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_legacyPublicIdentity(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  double v13 = objc_msgSend_ngmVersion(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16);
  double v21 = objc_msgSend_ngmPublicDeviceIdentity(self, v18, v19, v20);
  unint64_t v25 = v9 ^ v17 ^ objc_msgSend_hash(v21, v22, v23, v24) ^ 0x11;

  return v25;
}

- (id)legacySealMessage:(id)a3 withEncryptedAttributes:(id)a4 signedByFullIdentity:(id)a5 usingIdentitiesWithIdentifier:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v18 = a6;
  if (v18)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, v24, self, @"IDSMPDeviceIdentityContainer.m", 617, @"Invalid parameter not satisfying: %@", @"identifier");

    if (v15) {
      goto LABEL_3;
    }
  }
  unint64_t v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17, v19);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, v27, self, @"IDSMPDeviceIdentityContainer.m", 618, @"Invalid parameter not satisfying: %@", @"signingIdentity");

LABEL_3:
  double v20 = objc_msgSend__legacySealMessage_signedWithFullIdentity_error_(self, v16, (uint64_t)v13, v19, v15, a7);

  return v20;
}

- (id)sealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 withEncryptedAttributes:(id)a13 signedByFullIdentity:(id)a14 usedIdentityWithIdentifier:(id *)a15 error:(id *)a16 additionalResult:(id *)a17
{
  id v59 = a3;
  id v58 = a4;
  id v57 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a13;
  id v27 = a14;
  double v31 = v27;
  if (a15)
  {
    if (v27) {
      goto LABEL_3;
    }
  }
  else
  {
    v48 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v28, v29, v30);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, v50, self, @"IDSMPDeviceIdentityContainer.m", 638, @"Invalid parameter not satisfying: %@", @"outUsedIdentityIdentifier");

    if (v31) {
      goto LABEL_3;
    }
  }
  v51 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v28, v29, v30);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v51, v52, (uint64_t)a2, v53, self, @"IDSMPDeviceIdentityContainer.m", 639, @"Invalid parameter not satisfying: %@", @"signingIdentity");

LABEL_3:
  BOOL v32 = objc_msgSend_ngmPublicDeviceIdentity(self, v28, v29, v30);

  uint64_t v36 = objc_msgSend_accountIdentity(IDSFoundationLog, v33, v34, v35);
  BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  if (v32)
  {
    if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_DEFAULT, "Seal using ngm identities", buf, 2u);
    }

    HIBYTE(v54) = a12;
    LOBYTE(v54) = a11;
    v38 = self;
    double v40 = v58;
    v39 = v59;
    v41 = v57;
    v44 = objc_msgSend__ngmSealMessage_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_forceSizeOptimizations_resetState_withEncryptedAttributes_signedWithFullIdentity_usedIdentityWithIdentifier_error_additionalResult_(v38, v42, (uint64_t)v59, v43, v58, a5, v57, v22, v23, v24, v25, v54, v26, v31, a15, a16, a17);
  }
  else
  {
    if (v37)
    {
      *(_WORD *)id v60 = 0;
      _os_log_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_DEFAULT, "Seal using legacy identities", v60, 2u);
    }

    *a15 = @"pair";
    v39 = v59;
    v44 = objc_msgSend__legacySealMessage_signedWithFullIdentity_error_(self, v45, (uint64_t)v59, v46, v31, a16);
    v41 = v57;
    double v40 = v58;
  }

  return v44;
}

- (id)sealPaddyMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByFullIdentity:(id)a8 error:(id *)a9
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v82 = a4;
  id v81 = a5;
  id v80 = a6;
  id v16 = a7;
  id v17 = a8;
  double v21 = objc_msgSend_accountIdentity(IDSFoundationLog, v18, v19, v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ngmPublicDeviceIdentity(self, v22, v23, v24);
    id v26 = v25 = v16;
    double v30 = objc_msgSend_ngmFullDeviceIdentity(v17, v27, v28, v29);
    double v31 = NSNumber;
    uint64_t v35 = objc_msgSend_length(v15, v32, v33, v34);
    v38 = objc_msgSend_numberWithUnsignedInteger_(v31, v36, v35, v37);
    *(_DWORD *)buf = 138478339;
    id v91 = v26;
    __int16 v92 = 2113;
    v93 = v30;
    __int16 v94 = 2113;
    v95 = v38;
    _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "Sealing paddy message using ngm identities {encryptingIdentity: %{private}@, signingIdentity: %{private}@, message.length: %{private}@}", buf, 0x20u);

    id v16 = v25;
  }

  v44 = objc_msgSend_ngmFullDeviceIdentity(v17, v39, v40, v41);
  if (v44)
  {
    double v46 = objc_msgSend_ngmPublicDeviceIdentity(self, v42, v43, v45);
    double v50 = v46;
    if (!v46)
    {
      v51 = v15;
      if (a9)
      {
        v68 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v86 = *MEMORY[0x1E4F28228];
        uint64_t v87 = @"Tried to perform ngm encryption but encrypting container is missing NGMPublicDeviceIdentity";
        v69 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v47, (uint64_t)&v87, v49, &v86, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v68, v70, @"com.apple.ids.IDSEncryptionErrorDomain", v71, 12, v69);
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v55 = objc_msgSend_accountIdentity(IDSFoundationLog, v47, v48, v49);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_19DB75CF8();
      }
      double v52 = 0;
      goto LABEL_21;
    }
    id v83 = 0;
    v51 = v15;
    double v52 = objc_msgSend_sealPaddyMessage_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByFullIdentity_error_(v46, v47, (uint64_t)v15, v49, v82, v81, v80, v16, v44, &v83);
    v55 = v83;
    if (v52)
    {
LABEL_21:

      goto LABEL_22;
    }
    id v79 = v16;
    id v57 = objc_msgSend_accountIdentity(IDSFoundationLog, v53, v54, v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      if (a9) {
        id v78 = *a9;
      }
      else {
        id v78 = 0;
      }
      id v73 = objc_msgSend_debugDescription(self, v58, v59, v60);
      id v77 = objc_msgSend_debugDescription(v17, v74, v75, v76);
      *(_DWORD *)buf = 138543875;
      id v91 = v78;
      __int16 v92 = 2113;
      v93 = v73;
      __int16 v94 = 2113;
      v95 = v77;
      _os_log_error_impl(&dword_19D9BE000, v57, OS_LOG_TYPE_ERROR, "Contianer failed to encrypt with ngm identities - fail to seal paddy message {error: %{public}@, publicContainer: %{private}@, signingContainer:%{private}@}", buf, 0x20u);
    }
    if (v55)
    {
      uint64_t v84 = *MEMORY[0x1E4F28A50];
      id v85 = v55;
      double v63 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v61, (uint64_t)&v85, v62, &v84, 1);
      if (!a9)
      {
LABEL_10:

        id v16 = v79;
        goto LABEL_21;
      }
    }
    else
    {
      double v63 = 0;
      if (!a9) {
        goto LABEL_10;
      }
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v61, @"com.apple.ids.IDSEncryptionErrorDomain", v62, 21, v63);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (a9)
  {
    v64 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v88 = *MEMORY[0x1E4F28228];
    uint64_t v89 = @"Tried to perform ngm encryption but signing container is missing NGMFullDeviceIdentity";
    id v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v42, (uint64_t)&v89, v45, &v88, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v64, v66, @"com.apple.ids.IDSEncryptionErrorDomain", v67, 11, v65);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v51 = v15;
  double v50 = objc_msgSend_accountIdentity(IDSFoundationLog, v42, v43, v45);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
    sub_19DB75C6C();
  }
  double v52 = 0;
LABEL_22:

  return v52;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v8 = objc_msgSend_legacyPublicIdentity(self, v5, v6, v7);
  double v12 = objc_msgSend_ngmPublicDeviceIdentity(self, v9, v10, v11);
  id v16 = objc_msgSend_ngmVersion(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v3, v17, @"<%@: %p legacyPublicIdentity: %@, ngmPublicDeviceIdentity: %@, ngmVersion: %@>", v18, v4, self, v8, v12, v16);

  return v19;
}

- (id)debugDescription
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v8 = objc_msgSend_legacyPublicIdentity(self, v5, v6, v7);
  double v12 = objc_msgSend_debugDescription(v8, v9, v10, v11);
  id v16 = objc_msgSend_ngmPublicDeviceIdentity(self, v13, v14, v15);
  double v20 = objc_msgSend_debugDescription(v16, v17, v18, v19);
  double v24 = objc_msgSend_ngmVersion(self, v21, v22, v23);
  id v27 = objc_msgSend_stringWithFormat_(v3, v25, @"<%@: %p legacyPublicIdentity: %@, ngmPublicDeviceIdentity: %@, ngmVersion: %@>", v26, v4, self, v12, v20, v24);

  return v27;
}

- (id)_legacySealMessage:(id)a3 signedWithFullIdentity:(id)a4 error:(id *)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v13 = objc_msgSend_accountIdentity(IDSFoundationLog, v10, v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_msgSend_legacyPublicIdentity(self, v14, v15, v16);
    double v21 = objc_msgSend_legacyFullIdentity(v9, v18, v19, v20);
    uint64_t v22 = NSNumber;
    uint64_t v26 = objc_msgSend_length(v8, v23, v24, v25);
    double v29 = objc_msgSend_numberWithUnsignedInteger_(v22, v27, v26, v28);
    *(_DWORD *)buf = 138478339;
    double v71 = v17;
    __int16 v72 = 2113;
    id v73 = v21;
    __int16 v74 = 2113;
    uint64_t v75 = v29;
    _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "Sealing message using legacy identities {publicLegacyIdentity: %{private}@, fullLegacyIdentity: %{private}@, message.length: %{private}@}", buf, 0x20u);
  }
  uint64_t v35 = objc_msgSend_legacyFullIdentity(v9, v30, v31, v32);
  if (v35)
  {
    double v37 = objc_msgSend_legacyPublicIdentity(self, v33, v34, v36);
    double v41 = v37;
    if (!v37)
    {
      id v57 = objc_msgSend_accountIdentity(IDSFoundationLog, v38, v39, v40);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
        sub_19DB75E10();
      }

      if (a5)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v58, @"com.apple.ids.IDSEncryptionErrorDomain", v59, 9, 0);
        double v42 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        double v42 = 0;
      }
      goto LABEL_22;
    }
    id v67 = 0;
    double v42 = objc_msgSend_signAndProtectData_withSigner_error_(v37, v38, (uint64_t)v8, v40, v35, &v67);
    id v45 = v67;
    if (v42)
    {
LABEL_11:

LABEL_22:
      goto LABEL_23;
    }
    double v47 = objc_msgSend_accountIdentity(IDSFoundationLog, v43, v44, v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        objc_msgSend_debugDescription(self, v48, v49, v50, *a5);
      }
      else {
      v61 = objc_msgSend_debugDescription(self, v48, v49, v50, 0);
      }
      id v65 = objc_msgSend_debugDescription(v9, v62, v63, v64);
      *(_DWORD *)buf = 138543875;
      double v71 = v66;
      __int16 v72 = 2113;
      id v73 = v61;
      __int16 v74 = 2113;
      uint64_t v75 = v65;
      _os_log_error_impl(&dword_19D9BE000, v47, OS_LOG_TYPE_ERROR, "Contianer failed to encrypt with legacy identities - fail to seal message {error: %{public}@, publicContainer: %{private}@, signingContainer:%{private}@}", buf, 0x20u);
    }
    if (v45)
    {
      uint64_t v68 = *MEMORY[0x1E4F28A50];
      id v69 = v45;
      double v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v51, (uint64_t)&v69, v52, &v68, 1);
      if (!a5)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      double v53 = 0;
      if (!a5) {
        goto LABEL_10;
      }
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v51, @"com.apple.ids.IDSEncryptionErrorDomain", v52, 10, v53);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  uint64_t v54 = objc_msgSend_accountIdentity(IDSFoundationLog, v33, v34, v36);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
    sub_19DB75D84();
  }

  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v55, @"com.apple.ids.IDSEncryptionErrorDomain", v56, 8, 0);
    double v42 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v42 = 0;
  }
LABEL_23:

  return v42;
}

- (id)_ngmSealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 withEncryptedAttributes:(id)a13 signedWithFullIdentity:(id)a14 usedIdentityWithIdentifier:(id *)a15 error:(id *)a16 additionalResult:(id *)a17
{
  v222[1] = *MEMORY[0x1E4F143B8];
  id v203 = a3;
  id v22 = a4;
  id v197 = a6;
  id v202 = a7;
  id v201 = a8;
  id v200 = a9;
  id v199 = a10;
  id v198 = a13;
  id v23 = a14;
  id v27 = objc_msgSend_accountIdentity(IDSFoundationLog, v24, v25, v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = objc_msgSend_ngmPublicDeviceIdentity(self, v28, v29, v30);
    uint64_t v35 = objc_msgSend_ngmFullDeviceIdentity(v23, v32, v33, v34);
    id v36 = v22;
    double v37 = NSNumber;
    uint64_t v41 = objc_msgSend_length(v203, v38, v39, v40);
    uint64_t v44 = objc_msgSend_numberWithUnsignedInteger_(v37, v42, v41, v43);
    *(_DWORD *)buf = 138478339;
    id v210 = v31;
    __int16 v211 = 2113;
    id v212 = v35;
    __int16 v213 = 2113;
    id v214 = v44;
    _os_log_impl(&dword_19D9BE000, v27, OS_LOG_TYPE_DEFAULT, "Sealing message using ngm identities {encryptingIdentity: %{private}@, signingIdentity: %{private}@, message.length: %{private}@}", buf, 0x20u);

    id v22 = v36;
  }

  double v50 = objc_msgSend_ngmFullDeviceIdentity(v23, v45, v46, v47);
  if (v50)
  {
    uint64_t v52 = objc_msgSend_ngmPublicDeviceIdentity(self, v48, v49, v51);
    double v56 = (void *)v52;
    id v57 = a16;
    if (!v52)
    {
      if (a16)
      {
        uint64_t v87 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v219 = *MEMORY[0x1E4F28228];
        v220 = @"Tried to perform ngm encryption but encrypting container is missing NGMPublicDeviceIdentity";
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v53, (uint64_t)&v220, v55, &v219, 1);
        v89 = uint64_t v88 = v50;
        double v56 = 0;
        objc_msgSend_errorWithDomain_code_userInfo_(v87, v90, @"com.apple.ids.IDSEncryptionErrorDomain", v91, 12, v89);
        *a16 = (id)objc_claimAutoreleasedReturnValue();

        double v50 = v88;
      }
      __int16 v92 = objc_msgSend_accountIdentity(IDSFoundationLog, v53, v54, v55);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
        sub_19DB75F28();
      }

      v93 = v197;
      uint64_t v86 = 0;
      if (a15) {
        *a15 = @"pair-ec";
      }
      goto LABEL_77;
    }
    v192 = (void *)v52;
    v193 = v50;
    uint64_t v58 = objc_msgSend_ngmVersion(self, v53, v54, v55);
    if (v58)
    {
      double v62 = (void *)v58;
      uint64_t v63 = objc_msgSend_ngmVersion(v23, v59, v60, v61);
      if (v63)
      {
        id v67 = (void *)v63;
        id v68 = v22;
        id v69 = objc_msgSend_ngmVersion(self, v64, v65, v66);
        id v73 = objc_msgSend_ngmVersion(v23, v70, v71, v72);
        if (objc_msgSend_isEqualToNumber_(v69, v74, (uint64_t)v73, v75))
        {

          id v22 = v68;
          unint64_t v79 = 0x1E596F000;
          id v80 = a17;
LABEL_25:
          v93 = v197;
          if (!v197 || !v202 || !v201 || !v200 || !v199)
          {
            v150 = objc_msgSend_accountIdentity(*(void **)(v79 + 2896), v59, v60, v61);
            if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138413314;
              id v210 = v197;
              __int16 v211 = 2112;
              id v212 = v202;
              __int16 v213 = 2112;
              id v214 = v201;
              __int16 v215 = 2112;
              id v216 = v200;
              __int16 v217 = 2112;
              id v218 = v199;
              _os_log_error_impl(&dword_19D9BE000, v150, OS_LOG_TYPE_ERROR, "Failed to seal message - one or more required fields is nil {guid: %@ sendingURI: %@ sendingPushToken: %@ receivingURI: %@ receivingPushToken: %@}", buf, 0x34u);
            }

            double v50 = v193;
            if (v57)
            {
              v153 = v57;
              v154 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v207 = *MEMORY[0x1E4F28228];
              v208 = @"Tried to perform ngm encryption but one or more required fields is missing";
              v155 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v151, (uint64_t)&v208, v152, &v207, 1);
              v93 = v197;
              objc_msgSend_errorWithDomain_code_userInfo_(v154, v156, @"com.apple.ids.IDSEncryptionErrorDomain", v157, 22, v155);
              id *v153 = (id)objc_claimAutoreleasedReturnValue();
            }
            uint64_t v86 = 0;
            if (a15) {
              *a15 = @"pair-ec";
            }
            goto LABEL_76;
          }
          v102 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v59, v60, v61);
          id v204 = v102;
          HIBYTE(v191) = a12;
          LOBYTE(v191) = a11;
          uint64_t v86 = objc_msgSend_sealMessage_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_forceSizeOptimizations_resetState_encryptedAttributes_signedByFullIdentity_errors_(v192, v103, (uint64_t)v203, v104, v22, a5, v197, v202, v201, v200, v199, v191, v198, v193, &v204);
          id v105 = v204;

          v106 = v105;
          v109 = objc_msgSend_objectForKey_(v105, v107, (uint64_t)&unk_1EF028948, v108);
          v194 = v109;
          if (objc_msgSend_code(v109, v110, v111, v112))
          {
            id v196 = v109;
            v119 = a16;
            if (!v86)
            {
LABEL_55:
              v161 = objc_msgSend_accountIdentity(*(void **)(v79 + 2896), v116, v117, v118);
              if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
              {
                v186 = objc_msgSend_debugDescription(self, v162, v163, v164);
                v190 = objc_msgSend_debugDescription(v23, v187, v188, v189);
                *(_DWORD *)buf = 138543875;
                id v210 = v196;
                __int16 v211 = 2113;
                id v212 = v186;
                __int16 v213 = 2113;
                id v214 = v190;
                _os_log_error_impl(&dword_19D9BE000, v161, OS_LOG_TYPE_ERROR, "Container failed to encrypt with ngm identities - fail to seal message {error: %{public}@, encryptingIdentity: %{private}@, signingIdentity: %{private}@}", buf, 0x20u);

                v93 = v197;
                v119 = a16;
              }

              if (v196)
              {
                uint64_t v205 = *MEMORY[0x1E4F28A50];
                id v206 = v196;
                v167 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v165, (uint64_t)&v206, v166, &v205, 1);
              }
              else
              {
                v167 = 0;
              }
              if (v119)
              {
                objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v165, @"com.apple.ids.IDSEncryptionErrorDomain", v166, 15, v167);
                id *v119 = (id)objc_claimAutoreleasedReturnValue();
              }
            }
          }
          else
          {
            v158 = objc_msgSend_domain(v109, v113, v114, v115);
            if (objc_msgSend_isEqualToString_(v158, v159, @"com.apple.messageprotection", v160)) {
              id v196 = 0;
            }
            else {
              id v196 = v109;
            }
            v119 = a16;

            if (!v86) {
              goto LABEL_55;
            }
          }
          v168 = v106;
          if (v80 && v106)
          {
            v169 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            v172 = objc_msgSend_objectForKey_(v106, v170, (uint64_t)&unk_1EF028960, v171);
            if (v172) {
              CFDictionarySetValue(v169, &unk_1EF028978, v172);
            }
            v173 = v169;
            id *v80 = v173;
          }
          v175 = objc_msgSend_objectForKey_(v168, v116, (uint64_t)&unk_1EF028960, v118);
          if (v175)
          {
            v177 = objc_msgSend_objectForKey_(v168, v174, (uint64_t)&unk_1EF028948, v176);
            v178 = IDSSecondaryIdentityIdentifier;
            if (v177) {
              v178 = IDSNGMDeviceIdentityIdentifier;
            }
            v179 = a15;
            *a15 = *v178;
          }
          else
          {
            v179 = a15;
            *a15 = @"pair-ec";
          }

          v183 = objc_msgSend_accountIdentity(*(void **)(v79 + 2896), v180, v181, v182);
          if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
          {
            id v184 = *v179;
            *(_DWORD *)buf = 138412290;
            id v210 = v184;
            _os_log_impl(&dword_19D9BE000, v183, OS_LOG_TYPE_DEFAULT, "Finished encrypting message with identifier type: %@", buf, 0xCu);
          }

          double v50 = v193;
LABEL_76:
          double v56 = v192;
LABEL_77:

          goto LABEL_78;
        }
        __int16 v94 = objc_msgSend_ngmVersion(self, v76, v77, v78);
        uint64_t v98 = objc_msgSend_intValue(v94, v95, v96, v97);
        char isVersionSupported = objc_msgSend_isVersionSupported_(IDSNGMProtocolVersion, v99, v98, v100);

        id v57 = a16;
        id v22 = v68;
        unint64_t v79 = 0x1E596F000uLL;
        id v80 = a17;
        if (isVersionSupported) {
          goto LABEL_25;
        }
      }
      else
      {
      }
    }
    if (v57)
    {
      v120 = NSString;
      v121 = objc_msgSend_ngmVersion(self, v59, v60, v61);
      v125 = objc_msgSend_ngmVersion(v23, v122, v123, v124);
      v128 = objc_msgSend_stringWithFormat_(v120, v126, @"Unable to ngm seal message due to mismatching versions {encryptingIdentity.ngmVersion: %@, signingIdentity.ngmVersion: %@}", v127, v121, v125);

      id v129 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      objc_msgSend_setObject_forKeyedSubscript_(v129, v130, (uint64_t)v128, v131, *MEMORY[0x1E4F28228]);
      v135 = objc_msgSend_ngmVersion(self, v132, v133, v134);

      if (v135)
      {
        v139 = objc_msgSend_ngmVersion(self, v136, v137, v138);
        objc_msgSend_setObject_forKeyedSubscript_(v129, v140, (uint64_t)v139, v141, @"encryptingIdentityNGMVersion");
      }
      v142 = objc_msgSend_ngmVersion(v23, v136, v137, v138);

      if (v142)
      {
        v146 = objc_msgSend_ngmVersion(v23, v143, v144, v145);
        objc_msgSend_setObject_forKeyedSubscript_(v129, v147, (uint64_t)v146, v148, @"signingIdentityNGMVersion");
      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v143, @"com.apple.ids.IDSEncryptionErrorDomain", v145, 13, v129);
      *a16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v149 = objc_msgSend_accountIdentity(IDSFoundationLog, v59, v60, v61);
    if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR)) {
      sub_19DB75FB4();
    }

    double v56 = v192;
    uint64_t v86 = 0;
    if (a15) {
      *a15 = @"pair-ec";
    }
    v93 = v197;
    double v50 = v193;
    goto LABEL_77;
  }
  if (a16)
  {
    id v81 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v221 = *MEMORY[0x1E4F28228];
    v222[0] = @"Tried to perform ngm encryption but signing container is missing NGMFullDeviceIdentity";
    id v82 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v48, (uint64_t)v222, v51, &v221, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v81, v83, @"com.apple.ids.IDSEncryptionErrorDomain", v84, 11, v82);
    *a16 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v85 = objc_msgSend_accountIdentity(IDSFoundationLog, v48, v49, v51);
  if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
    sub_19DB75E9C();
  }

  uint64_t v86 = 0;
  if (a15) {
    *a15 = @"pair-ec";
  }
  v93 = v197;
LABEL_78:

  return v86;
}

- (id)dataRepresentationWithError:(id *)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_msgSend_legacyPublicIdentity(self, v6, v7, v8);
  double v12 = objc_msgSend_dataRepresentationWithError_(v9, v10, (uint64_t)a3, v11);

  if (!v12)
  {
    double v30 = objc_msgSend_accountIdentity(IDSFoundationLog, v13, v14, v15);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_19DB755D0((uint64_t *)a3);
    }
    goto LABEL_16;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v5, v13, (uint64_t)v12, v15, @"kLegacyPublicIdentityKey");
  uint64_t v19 = objc_msgSend_ngmPublicDeviceIdentity(self, v16, v17, v18);
  if (v19)
  {
    id v23 = (void *)v19;
    uint64_t v24 = objc_msgSend_ngmVersion(self, v20, v21, v22);

    if (v24)
    {
      double v26 = objc_msgSend_ngmPublicDeviceIdentity(self, v20, v25, v22);
      double v30 = objc_msgSend_identityData(v26, v27, v28, v29);

      double v34 = objc_msgSend_ngmPublicDeviceIdentity(self, v31, v32, v33);
      v38 = objc_msgSend_prekeyData(v34, v35, v36, v37);

      if (v30 && v38)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v5, v39, (uint64_t)v30, v41, @"kNGMPublicDeviceIdentityDataKey");
        objc_msgSend_setObject_forKeyedSubscript_(v5, v42, (uint64_t)v38, v43, @"kNGMPublicDevicePrekeyDataKey");
        double v47 = objc_msgSend_ngmVersion(self, v44, v45, v46);
        objc_msgSend_setObject_forKeyedSubscript_(v5, v48, (uint64_t)v47, v49, @"kNGMVersion");

        goto LABEL_7;
      }
      double v56 = objc_msgSend_accountIdentity(IDSFoundationLog, v39, v40, v41);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_19DB7605C((uint64_t)self, v56);
      }

LABEL_16:
      uint64_t v54 = 0;
      goto LABEL_17;
    }
  }
LABEL_7:
  double v50 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v20, (uint64_t)v5, v22, 200, 0, a3);
  double v30 = v50;
  if (v50)
  {
    double v30 = v50;
    uint64_t v54 = v30;
  }
  else
  {
    double v55 = objc_msgSend_accountIdentity(IDSFoundationLog, v51, v52, v53);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
    {
      if (a3) {
        id v58 = *a3;
      }
      else {
        id v58 = 0;
      }
      int v59 = 138543875;
      id v60 = v58;
      __int16 v61 = 2113;
      id v62 = v5;
      __int16 v63 = 2113;
      double v64 = self;
      _os_log_fault_impl(&dword_19D9BE000, v55, OS_LOG_TYPE_FAULT, "Failed to create plist - failed to serialize IDSMPFullDeviceIdentityContainer {error: %{public}@, dict: %{private}@, container: %{private}@}", (uint8_t *)&v59, 0x20u);
    }

    uint64_t v54 = 0;
  }
LABEL_17:

  return v54;
}

- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 ourSigningIdentity:(id)a5 theirURI:(id)a6 theirPushToken:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  double v22 = objc_msgSend_ngmFullDeviceIdentity(v14, v17, v18, v19);
  if (!v22)
  {
    uint64_t v28 = objc_msgSend_accountIdentity(IDSFoundationLog, v20, v21, v23);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_19DB760D4(v28, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_18;
  }
  uint64_t v24 = objc_msgSend_ngmPublicDeviceIdentity(self, v20, v21, v23);
  uint64_t v28 = v24;
  if (!v24)
  {
    uint64_t v40 = objc_msgSend_accountIdentity(IDSFoundationLog, v25, v26, v27);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_19DB7610C(v40, v41, v42, v43, v44, v45, v46, v47);
    }
    goto LABEL_17;
  }
  if (!v12 || !v13 || !v15 || !v16)
  {
    uint64_t v40 = objc_msgSend_accountIdentity(IDSFoundationLog, v25, v26, v27);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_19DB761B4(v40, v48, v49, v50, v51, v52, v53, v54);
    }
    goto LABEL_17;
  }
  if ((objc_msgSend_markForStateResetWithOurURI_ourPushToken_ourSigningIdentity_theirURI_theirPushToken_(v24, v25, (uint64_t)v12, v27, v13, v22, v15, v16) & 1) == 0)
  {
    uint64_t v40 = objc_msgSend_accountIdentity(IDSFoundationLog, v29, v30, v31);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_19DB76144((uint64_t)self);
    }
LABEL_17:

LABEL_18:
    BOOL v32 = 0;
    goto LABEL_19;
  }
  BOOL v32 = 1;
LABEL_19:

  return v32;
}

- (IDSMPPublicLegacyIdentity)legacyPublicIdentity
{
  return self->_legacyPublicIdentity;
}

- (IDSNGMPublicDeviceIdentity)ngmPublicDeviceIdentity
{
  return self->_ngmPublicDeviceIdentity;
}

- (NSNumber)ngmVersion
{
  return self->_ngmVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ngmVersion, 0);
  objc_storeStrong((id *)&self->_ngmPublicDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_legacyPublicIdentity, 0);
}

@end