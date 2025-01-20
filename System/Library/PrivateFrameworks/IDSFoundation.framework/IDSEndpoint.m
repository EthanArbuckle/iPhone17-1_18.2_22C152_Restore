@interface IDSEndpoint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEndpoint:(id)a3;
- (BOOL)isEqualToEndpoint:(id)a3 withDateTolerance:(double)a4;
- (BOOL)ktCapableFlag;
- (BOOL)mismatchedAccountFlag;
- (BOOL)verifiedBusiness;
- (IDSEndpoint)initWithCoder:(id)a3;
- (IDSEndpoint)initWithURI:(id)a3 capabilities:(id)a4 ngmVersion:(signed __int16)a5 legacyVersion:(char)a6 KTLoggableData:(id)a7 KTDeviceSignature:(id)a8 mismatchedAccountFlag:(BOOL)a9 ktCapableFlag:(BOOL)a10 pushTokenObject:(id)a11 sessionToken:(id)a12 expireDate:(id)a13 refreshDate:(id)a14 anonymizedSenderID:(id)a15 verifiedBusiness:(BOOL)a16 serializedPublicMessageProtectionIdentity:(id)a17 queryTimeInterval:(double)a18 serializedNGMDeviceIdentity:(id)a19 serializedNGMDevicePrekey:(id)a20 serializedApplicationPublicKey:(id)a21 endpointURIProperties:(id)a22 familyEndpointData:(id)a23 gameCenterData:(id)a24;
- (IDSEndpoint)initWithURI:(id)a3 clientData:(id)a4 KTLoggableData:(id)a5 KTDeviceSignature:(id)a6 mismatchedAccountFlag:(BOOL)a7 ktCapableFlag:(BOOL)a8 pushToken:(id)a9 sessionToken:(id)a10 expireDate:(id)a11 refreshDate:(id)a12 anonymizedSenderID:(id)a13 verifiedBusiness:(BOOL)a14 serializedPublicMessageProtectionIdentity:(id)a15 queryTimeInterval:(double)a16 serializedNGMDeviceIdentity:(id)a17 serializedNGMDevicePrekey:(id)a18 serializedApplicationPublicKey:(id)a19 endpointURIProperties:(id)a20 familyEndpointData:(id)a21 gameCenterData:(id)a22;
- (IDSEndpoint)initWithURI:(id)a3 clientData:(id)a4 pushToken:(id)a5 sessionToken:(id)a6 expireDate:(id)a7 refreshDate:(id)a8;
- (IDSEndpoint)initWithURI:(id)a3 serviceIdentifier:(id)a4 clientData:(id)a5 KTLoggableData:(id)a6 KTDeviceSignature:(id)a7 mismatchedAccountFlag:(BOOL)a8 ktCapableFlag:(BOOL)a9 pushToken:(id)a10 sessionToken:(id)a11 expireDate:(id)a12 refreshDate:(id)a13 anonymizedSenderID:(id)a14 verifiedBusiness:(BOOL)a15 serializedPublicMessageProtectionIdentity:(id)a16 queryTimeInterval:(double)a17 serializedNGMDeviceIdentity:(id)a18 serializedNGMDevicePrekey:(id)a19 serializedApplicationPublicKey:(id)a20 endpointURIProperties:(id)a21 familyEndpointData:(id)a22 gameCenterData:(id)a23;
- (IDSEndpointCapabilities)capabilities;
- (IDSFamilyEndpointData)familyEndpointData;
- (IDSGameCenterData)gameCenterData;
- (IDSMPPublicDeviceIdentityContainer)publicDeviceIdentityContainer;
- (IDSPushToken)pushTokenObject;
- (IDSURI)URI;
- (NSData)KTDeviceSignature;
- (NSData)KTLoggableData;
- (NSData)pushToken;
- (NSData)serializedApplicationPublicKey;
- (NSData)serializedLegacyPublicIdentity;
- (NSData)serializedNGMDeviceIdentity;
- (NSData)serializedNGMDevicePrekey;
- (NSData)serializedPublicLegacyIdentity;
- (NSData)sessionToken;
- (NSDate)expireDate;
- (NSDate)refreshDate;
- (NSError)identityContainerDeserializationError;
- (NSString)anonymizedSenderID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)senderCorrelationIdentifier;
- (NSString)shortHandle;
- (__SecKey)applicationPublicDeviceIdentity;
- (char)legacyVersion;
- (double)queryTimeInterval;
- (id)destinationURIs;
- (signed)ngmVersion;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationPublicDeviceIdentity:(__SecKey *)a3;
- (void)setCapabilities:(id)a3;
- (void)setPublicDeviceIdentityContainer:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setURI:(id)a3;
@end

@implementation IDSEndpoint

- (IDSEndpoint)initWithURI:(id)a3 clientData:(id)a4 pushToken:(id)a5 sessionToken:(id)a6 expireDate:(id)a7 refreshDate:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = objc_alloc_init(IDSEndpointURIProperties);
  char v24 = 1;
  refreshed = (IDSEndpoint *)objc_msgSend_initWithURI_clientData_KTLoggableData_KTDeviceSignature_mismatchedAccountFlag_ktCapableFlag_pushToken_sessionToken_expireDate_refreshDate_anonymizedSenderID_verifiedBusiness_serializedPublicMessageProtectionIdentity_queryTimeInterval_serializedNGMDeviceIdentity_serializedNGMDevicePrekey_serializedApplicationPublicKey_endpointURIProperties_familyEndpointData_gameCenterData_(self, v21, (uint64_t)v19, 0.0, v18, 0, 0, 0, 0, v17, v16, v15, v14, 0, v24, 0, 0, 0, 0,
                               v20,
                               0,
                               0);

  return refreshed;
}

- (IDSEndpoint)initWithURI:(id)a3 clientData:(id)a4 KTLoggableData:(id)a5 KTDeviceSignature:(id)a6 mismatchedAccountFlag:(BOOL)a7 ktCapableFlag:(BOOL)a8 pushToken:(id)a9 sessionToken:(id)a10 expireDate:(id)a11 refreshDate:(id)a12 anonymizedSenderID:(id)a13 verifiedBusiness:(BOOL)a14 serializedPublicMessageProtectionIdentity:(id)a15 queryTimeInterval:(double)a16 serializedNGMDeviceIdentity:(id)a17 serializedNGMDevicePrekey:(id)a18 serializedApplicationPublicKey:(id)a19 endpointURIProperties:(id)a20 familyEndpointData:(id)a21 gameCenterData:(id)a22
{
  return (IDSEndpoint *)objc_msgSend_initWithURI_serviceIdentifier_clientData_KTLoggableData_KTDeviceSignature_mismatchedAccountFlag_ktCapableFlag_pushToken_sessionToken_expireDate_refreshDate_anonymizedSenderID_verifiedBusiness_serializedPublicMessageProtectionIdentity_queryTimeInterval_serializedNGMDeviceIdentity_serializedNGMDevicePrekey_serializedApplicationPublicKey_endpointURIProperties_familyEndpointData_gameCenterData_(self, a2, (uint64_t)a3, a16, 0, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a17, a18,
                          a19,
                          a20,
                          a21,
                          a22);
}

- (IDSEndpoint)initWithURI:(id)a3 serviceIdentifier:(id)a4 clientData:(id)a5 KTLoggableData:(id)a6 KTDeviceSignature:(id)a7 mismatchedAccountFlag:(BOOL)a8 ktCapableFlag:(BOOL)a9 pushToken:(id)a10 sessionToken:(id)a11 expireDate:(id)a12 refreshDate:(id)a13 anonymizedSenderID:(id)a14 verifiedBusiness:(BOOL)a15 serializedPublicMessageProtectionIdentity:(id)a16 queryTimeInterval:(double)a17 serializedNGMDeviceIdentity:(id)a18 serializedNGMDevicePrekey:(id)a19 serializedApplicationPublicKey:(id)a20 endpointURIProperties:(id)a21 familyEndpointData:(id)a22 gameCenterData:(id)a23
{
  id v84 = a3;
  id v83 = a4;
  id v28 = a5;
  id v73 = a6;
  id v82 = a7;
  id v29 = a10;
  id v87 = a11;
  id v85 = a12;
  v30 = v28;
  id v31 = a13;
  id v32 = a14;
  id v33 = a16;
  id v34 = a18;
  id v35 = a19;
  id v81 = a20;
  v36 = (IDSEndpointURIProperties *)a21;
  id v79 = a22;
  id v37 = a23;
  v38 = 0;
  v77 = v32;
  v74 = v34;
  v75 = v31;
  if (!v30)
  {
    v39 = v82;
    v43 = v85;
    goto LABEL_12;
  }
  id v80 = v35;
  id v78 = v33;
  v39 = v82;
  if (!v29) {
    goto LABEL_10;
  }
  id v40 = v34;
  if (!v87) {
    goto LABEL_10;
  }
  id v41 = v32;
  id v42 = v31;
  v43 = v85;
  if (!v85)
  {
LABEL_11:
    id v33 = v78;
    id v35 = v80;
LABEL_12:
    v58 = v79;
    v59 = v73;
    goto LABEL_18;
  }
  if (!v42)
  {
LABEL_10:
    v43 = v85;
    goto LABEL_11;
  }
  id v44 = v42;
  id v76 = v37;
  if (!v36) {
    v36 = objc_alloc_init(IDSEndpointURIProperties);
  }
  v45 = [IDSEndpointCapabilities alloc];
  v70 = objc_msgSend_initWithCapabilitiesMap_(v45, v46, (uint64_t)v30, v47);
  v50 = objc_msgSend_objectForKeyedSubscript_(v30, v48, @"public-message-identity-ngm-version", v49);
  v71 = v30;
  v55 = objc_msgSend_objectForKeyedSubscript_(v30, v51, @"public-message-identity-version", v52);
  id v57 = v41;
  if (v50) {
    __int16 v67 = objc_msgSend_shortValue(v50, v53, v54, v56);
  }
  else {
    __int16 v67 = -1;
  }
  v58 = v79;
  v68 = v55;
  v69 = v50;
  if (v55) {
    char v60 = objc_msgSend_shortValue(v55, v53, v54, v56);
  }
  else {
    char v60 = -1;
  }
  v61 = objc_msgSend_pushTokenWithData_withServiceLoggingHint_(IDSPushToken, v53, (uint64_t)v29, v56, v83);
  id v33 = v78;
  id v65 = v44;
  id v66 = v57;
  v43 = v85;
  HIBYTE(v64) = a9;
  LOBYTE(v64) = a8;
  v39 = v82;
  v38 = (IDSEndpoint *)objc_retain((id)objc_msgSend_initWithURI_capabilities_ngmVersion_legacyVersion_KTLoggableData_KTDeviceSignature_mismatchedAccountFlag_ktCapableFlag_pushTokenObject_sessionToken_expireDate_refreshDate_anonymizedSenderID_verifiedBusiness_serializedPublicMessageProtectionIdentity_queryTimeInterval_serializedNGMDeviceIdentity_serializedNGMDevicePrekey_serializedApplicationPublicKey_endpointURIProperties_familyEndpointData_gameCenterData_(self, v62, (uint64_t)v84, a17, v70, v67, v60, v73, v82, v64, v61, v87, v85, v65, v66, a15, v78, v40, v80,
                                         v81,
                                         v36,
                                         v79,
                                         v76));

  id v35 = v80;
  id v37 = v76;
  v59 = v73;
  self = v38;
  v30 = v71;
LABEL_18:

  return v38;
}

- (IDSEndpoint)initWithURI:(id)a3 capabilities:(id)a4 ngmVersion:(signed __int16)a5 legacyVersion:(char)a6 KTLoggableData:(id)a7 KTDeviceSignature:(id)a8 mismatchedAccountFlag:(BOOL)a9 ktCapableFlag:(BOOL)a10 pushTokenObject:(id)a11 sessionToken:(id)a12 expireDate:(id)a13 refreshDate:(id)a14 anonymizedSenderID:(id)a15 verifiedBusiness:(BOOL)a16 serializedPublicMessageProtectionIdentity:(id)a17 queryTimeInterval:(double)a18 serializedNGMDeviceIdentity:(id)a19 serializedNGMDevicePrekey:(id)a20 serializedApplicationPublicKey:(id)a21 endpointURIProperties:(id)a22 familyEndpointData:(id)a23 gameCenterData:(id)a24
{
  id v81 = a3;
  id v74 = a4;
  id v28 = a4;
  id v86 = a7;
  id v85 = a8;
  id v29 = a11;
  id v30 = v28;
  id v31 = a12;
  id v88 = a13;
  id v87 = a14;
  id v80 = a15;
  id v79 = a17;
  id v78 = a19;
  id v32 = a20;
  id v33 = a21;
  id v34 = (IDSEndpointURIProperties *)a22;
  id v35 = a23;
  id v36 = a24;
  id v37 = 0;
  id v82 = v30;
  id v84 = v31;
  id v83 = v35;
  if (v30 && v29 && v31 && v88 && v87)
  {
    id v72 = v36;
    if (!v34) {
      id v34 = objc_alloc_init(IDSEndpointURIProperties);
    }
    v38 = v32;
    v89.receiver = self;
    v89.super_class = (Class)IDSEndpoint;
    v39 = [(IDSEndpoint *)&v89 init];
    id v40 = v39;
    if (v39)
    {
      v39->_queryTimeInterval = a18;
      objc_storeStrong((id *)&v39->_URI, a3);
      uint64_t v44 = objc_msgSend_copy(v86, v41, v42, v43);
      KTLoggableData = v40->_KTLoggableData;
      v40->_KTLoggableData = (NSData *)v44;

      uint64_t v49 = objc_msgSend_copy(v85, v46, v47, v48);
      KTDeviceSignature = v40->_KTDeviceSignature;
      v40->_KTDeviceSignature = (NSData *)v49;

      v40->_mismatchedAccountFlag = a9;
      v40->_ktCapableFlag = a10;
      objc_storeStrong((id *)&v40->_pushTokenObject, a11);
      uint64_t v54 = objc_msgSend_copy(v31, v51, v52, v53);
      sessionToken = v40->_sessionToken;
      v40->_sessionToken = (NSData *)v54;

      objc_storeStrong((id *)&v40->_expireDate, a13);
      objc_storeStrong((id *)&v40->_refreshDate, a14);
      objc_storeStrong((id *)&v40->_anonymizedSenderID, a15);
      v40->_verifiedBusiness = a16;
      uint64_t v59 = objc_msgSend_senderCorrelationIdentifier(v34, v56, v57, v58);
      senderCorrelationIdentifier = v40->_senderCorrelationIdentifier;
      v40->_senderCorrelationIdentifier = (NSString *)v59;

      uint64_t v64 = objc_msgSend_shortHandle(v34, v61, v62, v63);
      shortHandle = v40->_shortHandle;
      v40->_shortHandle = (NSString *)v64;

      objc_storeStrong((id *)&v40->_capabilities, v74);
      objc_storeStrong((id *)&v40->_serializedLegacyPublicIdentity, a17);
      objc_storeStrong((id *)&v40->_serializedNGMDevicePrekey, a20);
      objc_storeStrong((id *)&v40->_serializedApplicationPublicKey, a21);
      objc_storeStrong((id *)&v40->_serializedNGMDeviceIdentity, a19);
      v40->_ngmVersion = a5;
      v40->_legacyVersion = a6;
      objc_storeStrong((id *)&v40->_familyEndpointData, a23);
      objc_storeStrong((id *)&v40->_gameCenterData, a24);
    }
    id v66 = v40;
    id v37 = v66;
    v68 = v80;
    __int16 v67 = v81;
    v70 = v78;
    v69 = v79;
    id v36 = v72;
  }
  else
  {
    v38 = v32;
    v68 = v80;
    __int16 v67 = v81;
    v70 = v78;
    v69 = v79;
    id v66 = self;
  }

  return v37;
}

- (void)dealloc
{
  applicationPublicDeviceIdentity = self->_applicationPublicDeviceIdentity;
  if (applicationPublicDeviceIdentity)
  {
    CFRelease(applicationPublicDeviceIdentity);
    self->_applicationPublicDeviceIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSEndpoint;
  [(IDSEndpoint *)&v4 dealloc];
}

- (__SecKey)applicationPublicDeviceIdentity
{
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  result = self->_applicationPublicDeviceIdentity;
  if (!result)
  {
    if (self->_serializedApplicationPublicKey)
    {
      CFErrorRef error = 0;
      objc_super v4 = (void *)*MEMORY[0x1E4F3B6D8];
      keys[0] = *(void **)MEMORY[0x1E4F3B718];
      keys[1] = v4;
      v5 = (void *)*MEMORY[0x1E4F3B6F0];
      values[0] = *(void **)MEMORY[0x1E4F3B740];
      values[1] = v5;
      CFDictionaryRef v6 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
      self->_applicationPublicDeviceIdentity = SecKeyCreateWithData((CFDataRef)self->_serializedApplicationPublicKey, v6, &error);
      if (error)
      {
        v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8, v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          URI = self->_URI;
          pushTokenObject = self->_pushTokenObject;
          serializedApplicationPublicKey = self->_serializedApplicationPublicKey;
          *(_DWORD *)buf = 138544131;
          CFErrorRef v16 = error;
          __int16 v17 = 2113;
          id v18 = URI;
          __int16 v19 = 2113;
          v20 = pushTokenObject;
          __int16 v21 = 2113;
          v22 = serializedApplicationPublicKey;
          _os_log_error_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_ERROR, "Endpoint failed creating public identity {error : %{public}@, URI: %{private}@, pushToken: %{private}@, serializedApplicationPublicKey: %{private}@}", buf, 0x2Au);
        }
      }
      if (v6) {
        CFRelease(v6);
      }
      if (error) {
        CFRelease(error);
      }
      return self->_applicationPublicDeviceIdentity;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (IDSMPPublicDeviceIdentityContainer)publicDeviceIdentityContainer
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  publicDeviceIdentityContainer = self->_publicDeviceIdentityContainer;
  if (!publicDeviceIdentityContainer)
  {
    serializedLegacyPublicIdentity = self->_serializedLegacyPublicIdentity;
    id v81 = 0;
    CFDictionaryRef v6 = objc_msgSend_identityWithData_error_(IDSMPPublicLegacyIdentity, a2, (uint64_t)serializedLegacyPublicIdentity, v2, &v81);
    double v9 = (IDSURI *)v81;
    if (!v6)
    {
      v39 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8, v10);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        URI = self->_URI;
        pushTokenObject = self->_pushTokenObject;
        v75 = self->_serializedLegacyPublicIdentity;
        *(_DWORD *)buf = 138544131;
        id v87 = v9;
        __int16 v88 = 2113;
        objc_super v89 = URI;
        __int16 v90 = 2113;
        v91 = pushTokenObject;
        __int16 v92 = 2113;
        v93 = v75;
        _os_log_fault_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_FAULT, "Endpoint failed creating public identity {error : %{public}@, URI: %{private}@, pushToken: %{private}@, serializedPublicMessageProtectionIdentity: %{private}@}", buf, 0x2Au);
      }

      if (self->_serializedLegacyPublicIdentity) {
        uint64_t v42 = 6;
      }
      else {
        uint64_t v42 = 5;
      }
      if (v9)
      {
        uint64_t v82 = *MEMORY[0x1E4F28A50];
        id v83 = v9;
        __int16 v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)&v83, v41, &v82, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v43, IDSEndpointErrorDomain, v44, v42, v21);
      }
      else
      {
        __int16 v21 = 0;
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v40, IDSEndpointErrorDomain, v41, v42, 0);
      }
      uint64_t v47 = (NSError *)objc_claimAutoreleasedReturnValue();
      identityContainerDeserializationError = self->_identityContainerDeserializationError;
      self->_identityContainerDeserializationError = v47;
      goto LABEL_44;
    }
    serializedNGMDeviceIdentity = self->_serializedNGMDeviceIdentity;
    if (!serializedNGMDeviceIdentity || (serializedNGMDevicePrekey = self->_serializedNGMDevicePrekey) == 0)
    {
      v23 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, (uint64_t)serializedNGMDeviceIdentity, v10);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        char v24 = self->_URI;
        v25 = self->_pushTokenObject;
        *(_DWORD *)buf = 138478083;
        id v87 = v24;
        __int16 v88 = 2113;
        objc_super v89 = v25;
        _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "Endpoint missing serializedNGMDeviceIdentity -- creating legacy endpoint {URI: %{private}@, pushToken: %{private}@}", buf, 0x16u);
      }

      uint64_t v28 = objc_msgSend_valueForCapability_(self->_capabilities, v26, @"ec-version", v27);
      id v29 = _IDSECVersion();
      uint64_t v33 = objc_msgSend_integerValue(v29, v30, v31, v32);

      uint64_t v36 = objc_msgSend_valueForCapability_(self->_capabilities, v34, @"supports-certified-delivery-v1", v35);
      if (self->_serializedNGMDeviceIdentity)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v37, IDSEndpointErrorDomain, v38, 1, 0);
      }
      else
      {
        uint64_t v45 = 3;
        if (v28 < v33) {
          uint64_t v45 = 10;
        }
        if (!v36) {
          uint64_t v45 = 9;
        }
        if (self->_serializedNGMDevicePrekey) {
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v37, IDSEndpointErrorDomain, v38, 2, 0);
        }
        else {
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v37, IDSEndpointErrorDomain, v38, v45, 0);
        }
      }
      v46 = (NSError *)objc_claimAutoreleasedReturnValue();
      __int16 v21 = 0;
      identityContainerDeserializationError = 0;
      v20 = 0;
      v13 = self->_identityContainerDeserializationError;
      self->_identityContainerDeserializationError = v46;
      id v14 = v9;
      goto LABEL_39;
    }
    id v80 = v9;
    objc_msgSend_identityWithIdentityData_prekeyData_error_(IDSNGMPublicDeviceIdentity, v7, (uint64_t)serializedNGMDeviceIdentity, v10, serializedNGMDevicePrekey, &v80);
    v13 = (NSError *)objc_claimAutoreleasedReturnValue();
    id v14 = v80;

    if (v13)
    {
      if (self->_ngmVersion != -1)
      {
        v13 = v13;
        v20 = objc_msgSend_numberWithShort_(NSNumber, v18, self->_ngmVersion, v19);
        __int16 v21 = 0;
        identityContainerDeserializationError = v13;
LABEL_39:

        id v79 = v14;
        objc_msgSend_identityWithLegacyPublicIdentity_ngmPublicDeviceIdentity_ngmVersion_error_(IDSMPPublicDeviceIdentityContainer, v60, (uint64_t)v6, v61, identityContainerDeserializationError, v20, &v79);
        uint64_t v62 = (IDSMPPublicDeviceIdentityContainer *)objc_claimAutoreleasedReturnValue();
        double v9 = v79;

        double v63 = self->_publicDeviceIdentityContainer;
        self->_publicDeviceIdentityContainer = v62;

        if (!self->_publicDeviceIdentityContainer)
        {
          __int16 v67 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v64, v65, v66);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
            sub_19DB7EB48((uint64_t)v9, (uint64_t)self, v67);
          }

          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v68, IDSEndpointErrorDomain, v69, 8, v21);
          v70 = (NSError *)objc_claimAutoreleasedReturnValue();
          v71 = self->_identityContainerDeserializationError;
          self->_identityContainerDeserializationError = v70;
        }
LABEL_44:

        publicDeviceIdentityContainer = self->_publicDeviceIdentityContainer;
        goto LABEL_45;
      }
      double v53 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v15, v16, v17);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
        sub_19DB7EBE0((uint64_t)self, v53);
      }

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v54, IDSEndpointErrorDomain, v55, 4, 0);
      double v56 = (NSError *)objc_claimAutoreleasedReturnValue();
      uint64_t v57 = self->_identityContainerDeserializationError;
      self->_identityContainerDeserializationError = v56;

      __int16 v21 = 0;
    }
    else
    {
      double v48 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v15, v16, v17);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
      {
        id v76 = self->_serializedNGMDeviceIdentity;
        v77 = self->_URI;
        id v78 = self->_pushTokenObject;
        *(_DWORD *)buf = 138544131;
        id v87 = v14;
        __int16 v88 = 2113;
        objc_super v89 = v76;
        __int16 v90 = 2113;
        v91 = v77;
        __int16 v92 = 2113;
        v93 = v78;
        _os_log_fault_impl(&dword_19D9BE000, v48, OS_LOG_TYPE_FAULT, "Failed to deserialize IDSNGMPublicDeviceIdentity -- creating legacy endpoint {error: %{public}@, serializedNGMDeviceIdentity: %{private}@, URI: %{private}@, pushToken: %{private}@}", buf, 0x2Au);
      }

      if (v14)
      {
        uint64_t v84 = *MEMORY[0x1E4F28A50];
        id v85 = v14;
        __int16 v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v49, (uint64_t)&v85, v50, &v84, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v51, IDSEndpointErrorDomain, v52, 7, v21);
      }
      else
      {
        __int16 v21 = 0;
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v49, IDSEndpointErrorDomain, v50, 7, 0);
      }
      double v58 = (NSError *)objc_claimAutoreleasedReturnValue();
      uint64_t v59 = self->_identityContainerDeserializationError;
      self->_identityContainerDeserializationError = v58;
    }
    identityContainerDeserializationError = 0;
    v20 = 0;
    goto LABEL_39;
  }
LABEL_45:
  return publicDeviceIdentityContainer;
}

- (NSData)serializedPublicLegacyIdentity
{
  return self->_serializedLegacyPublicIdentity;
}

- (NSData)pushToken
{
  return (NSData *)objc_msgSend_rawToken(self->_pushTokenObject, a2, v2, v3);
}

- (NSString)description
{
  id v34 = NSString;
  uint64_t v3 = objc_opt_class();
  v7 = objc_msgSend_URI(self, v4, v5, v6);
  v11 = objc_msgSend_pushTokenObject(self, v8, v9, v10);
  id v15 = objc_msgSend_senderCorrelationIdentifier(self, v12, v13, v14);
  publicDeviceIdentityContainer = self->_publicDeviceIdentityContainer;
  v20 = objc_msgSend_serializedNGMDeviceIdentity(self, v17, v18, v19);
  applicationPublicDeviceIdentity = self->_applicationPublicDeviceIdentity;
  v25 = objc_msgSend_serializedApplicationPublicKey(self, v22, v23, v24);
  id v29 = objc_msgSend_capabilities(self, v26, v27, v28);
  double v32 = objc_msgSend_stringWithFormat_(v34, v30, @"<%@: %p URI: %@, pushToken: %@, mergeID: %@, publicDeviceIdentityContainer: %@, devicePublicIdentity: %@,  applicationPublicDeviceIdentity: %@, applicationDevicePublicIdentity: %@, capabilities: %@>", v31, v3, self, v7, v11, v15, publicDeviceIdentityContainer, v20, applicationPublicDeviceIdentity, v25, v29);

  return (NSString *)v32;
}

- (NSString)debugDescription
{
  double v38 = NSString;
  uint64_t v37 = objc_opt_class();
  double v6 = objc_msgSend_URI(self, v3, v4, v5);
  double v10 = objc_msgSend_pushTokenObject(self, v7, v8, v9);
  double v14 = objc_msgSend_senderCorrelationIdentifier(self, v11, v12, v13);
  publicDeviceIdentityContainer = self->_publicDeviceIdentityContainer;
  double v19 = objc_msgSend_serializedNGMDeviceIdentity(self, v16, v17, v18);
  applicationPublicDeviceIdentity = self->_applicationPublicDeviceIdentity;
  double v24 = objc_msgSend_serializedApplicationPublicKey(self, v21, v22, v23);
  double v28 = objc_msgSend_capabilities(self, v25, v26, v27);
  double v32 = objc_msgSend_debugDescription(v28, v29, v30, v31);
  double v35 = objc_msgSend_stringWithFormat_(v38, v33, @"<%@: %p URI: %@, pushToken: %@, mergeID: %@, publicDeviceIdentityContainer: %@, devicePublicIdentity: %@, applicationPublicDeviceIdentity: %@, applicationDevicePublicIdentity: %@, capabilities: %@>", v34, v37, self, v6, v10, v14, publicDeviceIdentityContainer, v19, applicationPublicDeviceIdentity, v24, v32);

  return (NSString *)v35;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToEndpoint = objc_msgSend_isEqualToEndpoint_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToEndpoint = 0;
  }

  return isEqualToEndpoint;
}

- (BOOL)isEqualToEndpoint:(id)a3
{
  double v5 = (IDSEndpoint *)a3;
  double v9 = v5;
  if (self == v5)
  {
    BOOL v31 = 1;
  }
  else
  {
    double queryTimeInterval = self->_queryTimeInterval;
    objc_msgSend_queryTimeInterval(v5, v6, v7, v8);
    double v14 = queryTimeInterval - v13;
    if (v14 < 0.0) {
      double v14 = -v14;
    }
    if (v14 < 2.22044605e-16)
    {
      URI = self->_URI;
      uint64_t v16 = objc_msgSend_URI(v9, v11, v12, v14);
      if (!objc_msgSend_isEqual_(URI, v17, (uint64_t)v16, v18))
      {
        BOOL v31 = 0;
LABEL_41:

        goto LABEL_42;
      }
      shortHandle = self->_shortHandle;
      objc_msgSend_shortHandle(v9, v19, v20, v21);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (shortHandle != v25)
      {
        double v27 = self->_shortHandle;
        double v28 = objc_msgSend_shortHandle(v9, v23, v24, v26);
        if (!objc_msgSend_isEqual_(v27, v29, (uint64_t)v28, v30))
        {
          BOOL v31 = 0;
          goto LABEL_39;
        }
        v179 = v28;
      }
      KTLoggableData = self->_KTLoggableData;
      objc_msgSend_KTLoggableData(v9, v23, v24, v26);
      double v35 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (KTLoggableData != v35)
      {
        uint64_t v37 = self->_KTLoggableData;
        uint64_t v3 = objc_msgSend_KTLoggableData(v9, v33, v34, v36);
        if ((objc_msgSend_isEqual_(v37, v38, (uint64_t)v3, v39) & 1) == 0)
        {
LABEL_35:

LABEL_36:
LABEL_37:
          BOOL v31 = 0;
          goto LABEL_38;
        }
      }
      KTDeviceSignature = self->_KTDeviceSignature;
      objc_msgSend_KTDeviceSignature(v9, v33, v34, v36);
      double v43 = (NSData *)objc_claimAutoreleasedReturnValue();
      v178 = KTDeviceSignature;
      if (KTDeviceSignature == v43)
      {
        v177 = v3;
      }
      else
      {
        uint64_t v45 = self->_KTDeviceSignature;
        uint64_t v46 = objc_msgSend_KTDeviceSignature(v9, v41, v42, v44);
        uint64_t v47 = v45;
        double v48 = (void *)v46;
        if ((objc_msgSend_isEqual_(v47, v49, v46, v50) & 1) == 0)
        {

          if (KTLoggableData == v35)
          {

            goto LABEL_37;
          }
          goto LABEL_35;
        }
        v176 = v48;
        v177 = v3;
      }
      pushTokenObject = self->_pushTokenObject;
      double v52 = objc_msgSend_pushTokenObject(v9, v41, v42, v44);
      if (!objc_msgSend_isEqual_(pushTokenObject, v53, (uint64_t)v52, v54))
      {
        BOOL v31 = 0;
        __int16 v92 = v177;
        goto LABEL_28;
      }
      sessionToken = self->_sessionToken;
      uint64_t v59 = objc_msgSend_sessionToken(v9, v55, v56, v57);
      char v60 = sessionToken;
      double v61 = (void *)v59;
      if (objc_msgSend_isEqual_(v60, v62, v59, v63))
      {
        v175 = v61;
        expireDate = self->_expireDate;
        uint64_t v68 = objc_msgSend_expireDate(v9, v64, v65, v66);
        double v69 = expireDate;
        v70 = (void *)v68;
        if (objc_msgSend_isEqual_(v69, v71, v68, v72))
        {
          v174 = v70;
          refreshDate = self->_refreshDate;
          uint64_t v77 = objc_msgSend_refreshDate(v9, v73, v74, v75);
          id v78 = refreshDate;
          id v79 = (void *)v77;
          if ((objc_msgSend_isEqual_(v78, v80, v77, v81) & 1) == 0)
          {

            uint64_t v3 = v177;
            if (v178 == v43)
            {
            }
            else
            {
            }
            if (KTLoggableData == v35) {
              goto LABEL_36;
            }
            goto LABEL_35;
          }
          v172 = v79;
          anonymizedSenderID = self->_anonymizedSenderID;
          objc_msgSend_anonymizedSenderID(v9, v82, v83, v84);
          v173 = (NSString *)objc_claimAutoreleasedReturnValue();
          v171 = anonymizedSenderID;
          if (anonymizedSenderID != v173)
          {
            objc_super v89 = self->_anonymizedSenderID;
            v170 = objc_msgSend_anonymizedSenderID(v9, v86, v87, v88);
            if (!objc_msgSend_isEqual_(v89, v90, (uint64_t)v170, v91))
            {
              BOOL v31 = 0;
              __int16 v92 = v177;
              goto LABEL_61;
            }
          }
          int verifiedBusiness = self->_verifiedBusiness;
          if (verifiedBusiness != objc_msgSend_verifiedBusiness(v9, v86, v87, v88))
          {
            BOOL v31 = 0;
            __int16 v92 = v177;
            if (v171 == v173) {
              goto LABEL_62;
            }
            goto LABEL_61;
          }
          senderCorrelationIdentifier = self->_senderCorrelationIdentifier;
          objc_msgSend_senderCorrelationIdentifier(v9, v95, v96, v97);
          v168 = senderCorrelationIdentifier;
          v169 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (senderCorrelationIdentifier != v169)
          {
            v102 = self->_senderCorrelationIdentifier;
            v167 = objc_msgSend_senderCorrelationIdentifier(v9, v99, v100, v101);
            if (!objc_msgSend_isEqual_(v102, v103, (uint64_t)v167, v104))
            {
              BOOL v31 = 0;
              __int16 v92 = v177;
              goto LABEL_96;
            }
          }
          capabilities = self->_capabilities;
          uint64_t v106 = objc_msgSend_capabilities(v9, v99, v100, v101);
          v107 = capabilities;
          v108 = (void *)v106;
          if (!objc_msgSend_isEqual_(v107, v109, v106, v110))
          {

            BOOL v31 = 0;
            v120 = v169;
            __int16 v92 = v177;
            if (v168 != v169) {
              goto LABEL_96;
            }
LABEL_69:

            if (v171 != v173) {
LABEL_28:
            }

            if (v178 == v43)
            {
LABEL_30:

LABEL_31:
              if (KTLoggableData != v35) {

              }
LABEL_38:
              double v28 = v179;
              if (shortHandle == v25)
              {
LABEL_40:

                goto LABEL_41;
              }
LABEL_39:

              goto LABEL_40;
            }
LABEL_29:

            goto LABEL_30;
          }
          serializedLegacyPublicIdentity = self->_serializedLegacyPublicIdentity;
          objc_msgSend_serializedLegacyPublicIdentity(v9, v111, v112, v113);
          v164 = v108;
          v165 = (NSData *)objc_claimAutoreleasedReturnValue();
          if (serializedLegacyPublicIdentity != v165)
          {
            v117 = self->_serializedLegacyPublicIdentity;
            v162 = objc_msgSend_serializedLegacyPublicIdentity(v9, v114, v115, v116);
            if (!objc_msgSend_isEqual_(v117, v118, (uint64_t)v162, v119))
            {
              BOOL v31 = 0;
              __int16 v92 = v177;
              goto LABEL_93;
            }
          }
          serializedNGMDevicePrekey = self->_serializedNGMDevicePrekey;
          objc_msgSend_serializedNGMDevicePrekey(v9, v114, v115, v116);
          v163 = (NSData *)objc_claimAutoreleasedReturnValue();
          v160 = serializedNGMDevicePrekey;
          if (serializedNGMDevicePrekey != v163)
          {
            v125 = self->_serializedNGMDevicePrekey;
            v159 = objc_msgSend_serializedNGMDevicePrekey(v9, v122, v123, v124);
            if (!objc_msgSend_isEqual_(v125, v126, (uint64_t)v159, v127))
            {
              BOOL v31 = 0;
              __int16 v92 = v177;
              goto LABEL_90;
            }
          }
          serializedNGMDeviceIdentity = self->_serializedNGMDeviceIdentity;
          objc_msgSend_serializedNGMDeviceIdentity(v9, v122, v123, v124);
          v161 = (NSData *)objc_claimAutoreleasedReturnValue();
          v158 = serializedNGMDeviceIdentity;
          if (serializedNGMDeviceIdentity == v161
            || (v132 = self->_serializedNGMDeviceIdentity,
                objc_msgSend_serializedNGMDeviceIdentity(v9, v129, v130, v131),
                v157 = objc_claimAutoreleasedReturnValue(),
                objc_msgSend_isEqual_(v132, v133, (uint64_t)v157, v134)))
          {
            serializedApplicationPublicKey = self->_serializedApplicationPublicKey;
            objc_msgSend_serializedApplicationPublicKey(v9, v129, v130, v131);
            v156 = (NSData *)objc_claimAutoreleasedReturnValue();
            if (serializedApplicationPublicKey == v156)
            {
              int ngmVersion = (unsigned __int16)self->_ngmVersion;
              if (ngmVersion == (unsigned __int16)objc_msgSend_ngmVersion(v9, v136, v137, v138))
              {
                int legacyVersion = self->_legacyVersion;
                BOOL v31 = legacyVersion == objc_msgSend_legacyVersion(v9, v151, v152, v153);
              }
              else
              {
                BOOL v31 = 0;
              }
            }
            else
            {
              v139 = self->_serializedApplicationPublicKey;
              v155 = objc_msgSend_serializedApplicationPublicKey(v9, v136, v137, v138);
              if ((objc_msgSend_isEqual_(v139, v140, (uint64_t)v155, v141) & 1) != 0
                && (int v145 = (unsigned __int16)self->_ngmVersion,
                    v145 == (unsigned __int16)objc_msgSend_ngmVersion(v9, v142, v143, v144)))
              {
                int v149 = self->_legacyVersion;
                BOOL v31 = v149 == objc_msgSend_legacyVersion(v9, v146, v147, v148);
              }
              else
              {
                BOOL v31 = 0;
              }
            }
            __int16 v92 = v177;
            if (v158 == v161)
            {
LABEL_89:

              if (v160 == v163)
              {

LABEL_92:
                if (serializedLegacyPublicIdentity == v165)
                {

LABEL_95:
                  v120 = v169;
                  if (v168 != v169)
                  {
LABEL_96:

                    if (v171 == v173)
                    {
LABEL_62:

                      if (v178 == v43)
                      {

                        goto LABEL_31;
                      }
                      goto LABEL_29;
                    }
LABEL_61:

                    goto LABEL_62;
                  }
                  goto LABEL_69;
                }
LABEL_93:

                goto LABEL_95;
              }
LABEL_90:

              goto LABEL_92;
            }
          }
          else
          {
            BOOL v31 = 0;
            __int16 v92 = v177;
          }

          goto LABEL_89;
        }
      }
      else
      {
      }
      if (v178 == v43)
      {
      }
      else
      {
      }
      if (KTLoggableData != v35) {

      }
      goto LABEL_36;
    }
    BOOL v31 = 0;
  }
LABEL_42:

  return v31;
}

- (unint64_t)hash
{
  double v5 = objc_msgSend_pushToken(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  double v13 = objc_msgSend_sessionToken(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqualToEndpoint:(id)a3 withDateTolerance:(double)a4
{
  uint64_t v7 = (IDSEndpoint *)a3;
  uint64_t v11 = v7;
  if (self == v7)
  {
    BOOL v32 = 1;
  }
  else
  {
    double queryTimeInterval = self->_queryTimeInterval;
    objc_msgSend_queryTimeInterval(v7, v8, v9, v10);
    double v16 = queryTimeInterval - v15;
    if (v16 < 0.0) {
      double v16 = -v16;
    }
    if (v16 < a4)
    {
      URI = self->_URI;
      double v18 = objc_msgSend_URI(v11, v13, v14, v16);
      if (!objc_msgSend_isEqual_(URI, v19, (uint64_t)v18, v20))
      {
        BOOL v32 = 0;
LABEL_32:

        goto LABEL_33;
      }
      KTLoggableData = self->_KTLoggableData;
      objc_msgSend_KTLoggableData(v11, v21, v22, v23);
      double v27 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (KTLoggableData != v27)
      {
        id v29 = self->_KTLoggableData;
        id v4 = objc_msgSend_KTLoggableData(v11, v25, v26, v28);
        if (!objc_msgSend_isEqual_(v29, v30, (uint64_t)v4, v31))
        {
          BOOL v32 = 0;
          goto LABEL_30;
        }
      }
      KTDeviceSignature = self->_KTDeviceSignature;
      objc_msgSend_KTDeviceSignature(v11, v25, v26, v28);
      double v36 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (KTDeviceSignature != v36)
      {
        double v38 = self->_KTDeviceSignature;
        double v39 = objc_msgSend_KTDeviceSignature(v11, v34, v35, v37);
        if ((objc_msgSend_isEqual_(v38, v40, (uint64_t)v39, v41) & 1) == 0)
        {

          goto LABEL_27;
        }
        v166 = v39;
      }
      pushTokenObject = self->_pushTokenObject;
      double v43 = objc_msgSend_pushTokenObject(v11, v34, v35, v37);
      if (!objc_msgSend_isEqual_(pushTokenObject, v44, (uint64_t)v43, v45))
      {
        BOOL v32 = 0;
        goto LABEL_23;
      }
      v165 = v4;
      sessionToken = self->_sessionToken;
      double v50 = objc_msgSend_sessionToken(v11, v46, v47, v48);
      if (objc_msgSend_isEqual_(sessionToken, v51, (uint64_t)v50, v52))
      {
        expireDate = self->_expireDate;
        uint64_t v57 = objc_msgSend_expireDate(v11, v53, v54, v55);
        double v58 = expireDate;
        uint64_t v59 = (void *)v57;
        objc_msgSend_timeIntervalSinceDate_(v58, v60, v57, v61);
        double v65 = fabs(v64);
        if (v65 < a4)
        {
          v164 = v59;
          refreshDate = self->_refreshDate;
          uint64_t v67 = objc_msgSend_refreshDate(v11, v62, v63, v65);
          uint64_t v68 = refreshDate;
          double v69 = (void *)v67;
          objc_msgSend_timeIntervalSinceDate_(v68, v70, v67, v71);
          double v75 = fabs(v74);
          if (v75 < a4)
          {
            v162 = v69;
            anonymizedSenderID = self->_anonymizedSenderID;
            objc_msgSend_anonymizedSenderID(v11, v72, v73, v75);
            v163 = (NSString *)objc_claimAutoreleasedReturnValue();
            v161 = anonymizedSenderID;
            if (anonymizedSenderID != v163)
            {
              id v80 = self->_anonymizedSenderID;
              v160 = objc_msgSend_anonymizedSenderID(v11, v77, v78, v79);
              if (!objc_msgSend_isEqual_(v80, v81, (uint64_t)v160, v82))
              {
                BOOL v32 = 0;
                id v4 = v165;
                goto LABEL_48;
              }
            }
            int verifiedBusiness = self->_verifiedBusiness;
            if (verifiedBusiness != objc_msgSend_verifiedBusiness(v11, v77, v78, v79))
            {
              BOOL v32 = 0;
              id v4 = v165;
              if (v161 == v163)
              {
LABEL_49:

                if (KTDeviceSignature != v36)
                {
                  uint64_t v83 = v166;
                  goto LABEL_24;
                }

LABEL_29:
                if (KTLoggableData == v27)
                {
LABEL_31:

                  goto LABEL_32;
                }
LABEL_30:

                goto LABEL_31;
              }
LABEL_48:

              goto LABEL_49;
            }
            senderCorrelationIdentifier = self->_senderCorrelationIdentifier;
            objc_msgSend_senderCorrelationIdentifier(v11, v86, v87, v88);
            v158 = senderCorrelationIdentifier;
            v159 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (senderCorrelationIdentifier != v159)
            {
              v93 = self->_senderCorrelationIdentifier;
              v157 = objc_msgSend_senderCorrelationIdentifier(v11, v90, v91, v92);
              if (!objc_msgSend_isEqual_(v93, v94, (uint64_t)v157, v95))
              {
                BOOL v32 = 0;
                id v4 = v165;
                goto LABEL_85;
              }
            }
            capabilities = self->_capabilities;
            uint64_t v97 = objc_msgSend_capabilities(v11, v90, v91, v92);
            v98 = capabilities;
            v99 = (void *)v97;
            if (!objc_msgSend_isEqual_(v98, v100, v97, v101))
            {

              BOOL v32 = 0;
              v111 = v159;
              id v4 = v165;
              if (v158 != v159) {
                goto LABEL_85;
              }
LABEL_57:

              if (v161 != v163) {
LABEL_23:
              }

              uint64_t v83 = v166;
              if (KTDeviceSignature == v36)
              {
LABEL_25:

                goto LABEL_29;
              }
LABEL_24:

              goto LABEL_25;
            }
            serializedLegacyPublicIdentity = self->_serializedLegacyPublicIdentity;
            objc_msgSend_serializedLegacyPublicIdentity(v11, v102, v103, v104);
            v154 = v99;
            v155 = (NSData *)objc_claimAutoreleasedReturnValue();
            if (serializedLegacyPublicIdentity != v155)
            {
              v108 = self->_serializedLegacyPublicIdentity;
              v151 = objc_msgSend_serializedLegacyPublicIdentity(v11, v105, v106, v107);
              if (!objc_msgSend_isEqual_(v108, v109, (uint64_t)v151, v110))
              {
                BOOL v32 = 0;
                id v4 = v165;
                goto LABEL_82;
              }
            }
            serializedNGMDevicePrekey = self->_serializedNGMDevicePrekey;
            objc_msgSend_serializedNGMDevicePrekey(v11, v105, v106, v107);
            uint64_t v152 = (NSData *)objc_claimAutoreleasedReturnValue();
            if (serializedNGMDevicePrekey != v152)
            {
              uint64_t v115 = self->_serializedNGMDevicePrekey;
              int v149 = objc_msgSend_serializedNGMDevicePrekey(v11, v112, v113, v114);
              if (!objc_msgSend_isEqual_(v115, v116, (uint64_t)v149, v117))
              {
                BOOL v32 = 0;
                id v4 = v165;
                goto LABEL_79;
              }
            }
            serializedNGMDeviceIdentity = self->_serializedNGMDeviceIdentity;
            objc_msgSend_serializedNGMDeviceIdentity(v11, v112, v113, v114);
            v150 = (NSData *)objc_claimAutoreleasedReturnValue();
            double v148 = serializedNGMDeviceIdentity;
            if (serializedNGMDeviceIdentity == v150
              || (v122 = self->_serializedNGMDeviceIdentity,
                  objc_msgSend_serializedNGMDeviceIdentity(v11, v119, v120, v121),
                  uint64_t v147 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend_isEqual_(v122, v123, (uint64_t)v147, v124)))
            {
              serializedApplicationPublicKey = self->_serializedApplicationPublicKey;
              objc_msgSend_serializedApplicationPublicKey(v11, v119, v120, v121);
              v146 = (NSData *)objc_claimAutoreleasedReturnValue();
              if (serializedApplicationPublicKey == v146)
              {
                int ngmVersion = (unsigned __int16)self->_ngmVersion;
                if (ngmVersion == (unsigned __int16)objc_msgSend_ngmVersion(v11, v126, v127, v128))
                {
                  int legacyVersion = self->_legacyVersion;
                  BOOL v32 = legacyVersion == objc_msgSend_legacyVersion(v11, v141, v142, v143);
                }
                else
                {
                  BOOL v32 = 0;
                }
              }
              else
              {
                v129 = self->_serializedApplicationPublicKey;
                int v145 = objc_msgSend_serializedApplicationPublicKey(v11, v126, v127, v128);
                if ((objc_msgSend_isEqual_(v129, v130, (uint64_t)v145, v131) & 1) != 0
                  && (int v135 = (unsigned __int16)self->_ngmVersion,
                      v135 == (unsigned __int16)objc_msgSend_ngmVersion(v11, v132, v133, v134)))
                {
                  int v139 = self->_legacyVersion;
                  BOOL v32 = v139 == objc_msgSend_legacyVersion(v11, v136, v137, v138);
                }
                else
                {
                  BOOL v32 = 0;
                }
              }
              id v4 = v165;
              if (v148 == v150)
              {

LABEL_78:
                if (serializedNGMDevicePrekey == v152)
                {

LABEL_81:
                  if (serializedLegacyPublicIdentity == v155)
                  {

LABEL_84:
                    v111 = v159;
                    if (v158 != v159)
                    {
LABEL_85:

                      if (v161 == v163) {
                        goto LABEL_49;
                      }
                      goto LABEL_48;
                    }
                    goto LABEL_57;
                  }
LABEL_82:

                  goto LABEL_84;
                }
LABEL_79:

                goto LABEL_81;
              }
            }
            else
            {
              BOOL v32 = 0;
              id v4 = v165;
            }

            goto LABEL_78;
          }

          id v4 = v165;
          if (KTDeviceSignature == v36)
          {

            goto LABEL_28;
          }

LABEL_27:
LABEL_28:
          BOOL v32 = 0;
          goto LABEL_29;
        }
      }
      if (KTDeviceSignature == v36)
      {
      }
      else
      {
      }
      BOOL v32 = 0;
      id v4 = v165;
      if (KTLoggableData == v27) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    BOOL v32 = 0;
  }
LABEL_33:

  return v32;
}

- (id)destinationURIs
{
  pushTokenObject = self->_pushTokenObject;
  if (pushTokenObject && (URI = self->_URI) != 0)
  {
    double v5 = (void *)MEMORY[0x1E4F1CAD0];
    double v6 = objc_msgSend_URIByAddingPushToken_(URI, a2, (uint64_t)pushTokenObject, v2);
    double v10 = objc_msgSend_prefixedURI(v6, v7, v8, v9);
    double v13 = objc_msgSend_setWithObject_(v5, v11, (uint64_t)v10, v12);
  }
  else
  {
    double v13 = 0;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSEndpoint)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v160 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v5, v4, v6, @"uri");
  uint64_t v7 = objc_opt_class();
  double v10 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v8, v7, v9, @"KTLoggableData");
  uint64_t v11 = objc_opt_class();
  uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v12, v11, v13, @"KTDeviceSignature");
  uint64_t v15 = objc_opt_class();
  v161 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v16, v15, v17, @"pushToken");
  uint64_t v18 = objc_opt_class();
  v162 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v19, v18, v20, @"pushTokenObj");
  uint64_t v21 = objc_opt_class();
  uint64_t v156 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v22, v21, v23, @"sessionToken");
  uint64_t v24 = objc_opt_class();
  double v27 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v25, v24, v26, @"expireDate");
  uint64_t v28 = objc_opt_class();
  uint64_t v154 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v29, v28, v30, @"refreshDate");
  uint64_t v31 = objc_opt_class();
  uint64_t v34 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v32, v31, v33, @"anonymizedSenderID");
  objc_msgSend_decodeDoubleForKey_(v3, v35, @"queryTimeInterval", v36);
  double v38 = v37;
  uint64_t v39 = objc_opt_class();
  uint64_t v42 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v40, v39, v41, @"serializedNGMDeviceIdentity");
  uint64_t v43 = objc_opt_class();
  uint64_t v152 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v44, v43, v45, @"serializedApplicationPublicKey");
  uint64_t v46 = objc_opt_class();
  v158 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v47, v46, v48, @"familyEndpointData");
  uint64_t v49 = objc_opt_class();
  v157 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v50, v49, v51, @"gameCenterData");
  double v52 = objc_alloc_init(IDSEndpointURIProperties);
  uint64_t v53 = objc_opt_class();
  uint64_t v56 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v54, v53, v55, @"senderCorrelationIdentifier");
  objc_msgSend_setSenderCorrelationIdentifier_(v52, v57, (uint64_t)v56, v58);

  uint64_t v59 = objc_opt_class();
  uint64_t v62 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v60, v59, v61, @"shortHandle");
  v151 = v52;
  objc_msgSend_setShortHandle_(v52, v63, (uint64_t)v62, v64);

  double v65 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v66 = objc_opt_class();
  uint64_t v67 = objc_opt_class();
  uint64_t v68 = objc_opt_class();
  double v71 = objc_msgSend_setWithObjects_(v65, v69, v66, v70, v67, v68, 0);
  double v74 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v72, (uint64_t)v71, v73, @"clientData");

  int v149 = v10;
  v159 = (void *)v14;
  v155 = v27;
  double v153 = v42;
  v150 = v74;
  if (v74)
  {
    uint64_t v77 = objc_opt_class();
    id v80 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v78, v77, v79, @"verifiedBusiness");
    char v84 = objc_msgSend_BOOLValue(v80, v81, v82, v83);

    objc_msgSend_decodeBoolForKey_(v3, v85, @"KTMismatchedAccountFlag", v86);
    objc_msgSend_decodeBoolForKey_(v3, v87, @"KTCapableFlag", v88);
    uint64_t v91 = objc_msgSend_objectForKey_(v74, v89, @"public-message-ngm-device-prekey-data-key", v90);
    uint64_t v96 = objc_msgSend_objectForKey_(v74, v92, @"public-message-identity-key", v93);
    if (v96 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v98 = v74;
      v99 = (void *)v34;
      uint64_t v100 = (IDSEndpoint *)(id)objc_msgSend_initWithURI_clientData_KTLoggableData_KTDeviceSignature_mismatchedAccountFlag_ktCapableFlag_pushToken_sessionToken_expireDate_refreshDate_anonymizedSenderID_verifiedBusiness_serializedPublicMessageProtectionIdentity_queryTimeInterval_serializedNGMDeviceIdentity_serializedNGMDevicePrekey_serializedApplicationPublicKey_endpointURIProperties_familyEndpointData_gameCenterData_(self, v94, (uint64_t)v160, v38, v98, v161, v156, v27, v154, v34, v84, v96, v153, v91, v152, v151, v158, v157);
      self = v100;
    }
    else
    {
      double v101 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v94, v95, v97);
      if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT)) {
        sub_19DB7EC6C((uint64_t)v96, v101);
      }
      v99 = (void *)v34;

      double v104 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v102, IDSEndpointErrorDomain, v103, 5, 0);
      objc_msgSend_failWithError_(v3, v105, (uint64_t)v104, v106);

      uint64_t v100 = 0;
    }

    double v107 = (void *)v154;
    v108 = (void *)v152;
    uint64_t v42 = v153;
    v109 = v151;
    double v110 = (void *)v156;
  }
  else
  {
    uint64_t v147 = (void *)v34;
    char v145 = objc_msgSend_decodeBoolForKey_(v3, v75, @"verifiedBusinessb", v76);
    char v146 = objc_msgSend_decodeBoolForKey_(v3, v111, @"KTMismatchedAccountFlag", v112);
    char v144 = objc_msgSend_decodeBoolForKey_(v3, v113, @"KTCapableFlag", v114);
    uint64_t v115 = objc_opt_class();
    double v148 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v116, v115, v117, @"serializedLegacyPublicIdentity");
    uint64_t v118 = objc_opt_class();
    uint64_t v121 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v119, v118, v120, @"serializedNGMDevicePrekey");
    __int16 v124 = objc_msgSend_decodeIntForKey_(v3, v122, @"NGMVersion", v123);
    char v127 = objc_msgSend_decodeIntForKey_(v3, v125, @"legacyVersion", v126);
    uint64_t v128 = objc_opt_class();
    v132 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v129, v128, v130, @"capabilities");
    uint64_t v134 = (uint64_t)v162;
    if (v162)
    {
      double v107 = (void *)v154;
      v136 = v157;
      int v135 = v158;
    }
    else
    {
      double v107 = (void *)v154;
      v136 = v157;
      int v135 = v158;
      if (v161)
      {
        uint64_t v134 = objc_msgSend_pushTokenWithData_(IDSPushToken, v131, (uint64_t)v161, v133);
      }
    }
    v162 = (void *)v134;
    double v141 = v135;
    uint64_t v142 = v136;
    v109 = v151;
    v108 = (void *)v152;
    double v143 = (void *)v121;
    uint64_t v140 = v121;
    v99 = v147;
    BYTE1(v139) = v144;
    LOBYTE(v139) = v146;
    double v10 = v149;
    uint64_t v137 = (IDSEndpoint *)objc_retain((id)objc_msgSend_initWithURI_capabilities_ngmVersion_legacyVersion_KTLoggableData_KTDeviceSignature_mismatchedAccountFlag_ktCapableFlag_pushTokenObject_sessionToken_expireDate_refreshDate_anonymizedSenderID_verifiedBusiness_serializedPublicMessageProtectionIdentity_queryTimeInterval_serializedNGMDeviceIdentity_serializedNGMDevicePrekey_serializedApplicationPublicKey_endpointURIProperties_familyEndpointData_gameCenterData_(self, v131, (uint64_t)v160, v38, v132, v124, v127, v149, v159, v139, v134, v156, v155, v107, v147, v145, v148, v42, v140,
                                            v152,
                                            v151,
                                            v141,
                                            v142));

    double v27 = v155;
    uint64_t v100 = v137;
    double v110 = (void *)v156;

    self = v100;
  }

  return v100;
}

- (void)encodeWithCoder:(id)a3
{
  double queryTimeInterval = self->_queryTimeInterval;
  id v5 = a3;
  objc_msgSend_encodeDouble_forKey_(v5, v6, @"queryTimeInterval", queryTimeInterval);
  double v10 = objc_msgSend_URI(self, v7, v8, v9);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)v10, v12, @"uri");

  double v16 = objc_msgSend_KTLoggableData(self, v13, v14, v15);
  objc_msgSend_encodeObject_forKey_(v5, v17, (uint64_t)v16, v18, @"KTLoggableData");

  uint64_t v22 = objc_msgSend_KTDeviceSignature(self, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v5, v23, (uint64_t)v22, v24, @"KTDeviceSignature");

  uint64_t v28 = objc_msgSend_pushTokenObject(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v5, v29, (uint64_t)v28, v30, @"pushTokenObj");

  uint64_t v34 = objc_msgSend_sessionToken(self, v31, v32, v33);
  objc_msgSend_encodeObject_forKey_(v5, v35, (uint64_t)v34, v36, @"sessionToken");

  id v40 = objc_msgSend_expireDate(self, v37, v38, v39);
  objc_msgSend_encodeObject_forKey_(v5, v41, (uint64_t)v40, v42, @"expireDate");

  uint64_t v46 = objc_msgSend_refreshDate(self, v43, v44, v45);
  objc_msgSend_encodeObject_forKey_(v5, v47, (uint64_t)v46, v48, @"refreshDate");

  double v52 = objc_msgSend_anonymizedSenderID(self, v49, v50, v51);
  objc_msgSend_encodeObject_forKey_(v5, v53, (uint64_t)v52, v54, @"anonymizedSenderID");

  uint64_t v58 = objc_msgSend_verifiedBusiness(self, v55, v56, v57);
  objc_msgSend_encodeBool_forKey_(v5, v59, v58, v60, @"verifiedBusinessb");
  uint64_t v64 = objc_msgSend_mismatchedAccountFlag(self, v61, v62, v63);
  objc_msgSend_encodeBool_forKey_(v5, v65, v64, v66, @"KTMismatchedAccountFlag");
  uint64_t v70 = objc_msgSend_ktCapableFlag(self, v67, v68, v69);
  objc_msgSend_encodeBool_forKey_(v5, v71, v70, v72, @"KTCapableFlag");
  double v76 = objc_msgSend_senderCorrelationIdentifier(self, v73, v74, v75);
  objc_msgSend_encodeObject_forKey_(v5, v77, (uint64_t)v76, v78, @"senderCorrelationIdentifier");

  uint64_t v82 = objc_msgSend_shortHandle(self, v79, v80, v81);
  objc_msgSend_encodeObject_forKey_(v5, v83, (uint64_t)v82, v84, @"shortHandle");

  double v88 = objc_msgSend_serializedNGMDeviceIdentity(self, v85, v86, v87);
  objc_msgSend_encodeObject_forKey_(v5, v89, (uint64_t)v88, v90, @"serializedNGMDeviceIdentity");

  uint64_t v94 = objc_msgSend_serializedLegacyPublicIdentity(self, v91, v92, v93);
  objc_msgSend_encodeObject_forKey_(v5, v95, (uint64_t)v94, v96, @"serializedLegacyPublicIdentity");

  uint64_t v100 = objc_msgSend_serializedNGMDevicePrekey(self, v97, v98, v99);
  objc_msgSend_encodeObject_forKey_(v5, v101, (uint64_t)v100, v102, @"serializedNGMDevicePrekey");

  double v106 = objc_msgSend_serializedApplicationPublicKey(self, v103, v104, v105);
  objc_msgSend_encodeObject_forKey_(v5, v107, (uint64_t)v106, v108, @"serializedApplicationPublicKey");

  uint64_t v112 = objc_msgSend_ngmVersion(self, v109, v110, v111);
  objc_msgSend_encodeInt_forKey_(v5, v113, v112, v114, @"NGMVersion");
  uint64_t v118 = objc_msgSend_legacyVersion(self, v115, v116, v117);
  objc_msgSend_encodeInt_forKey_(v5, v119, v118, v120, @"legacyVersion");
  __int16 v124 = objc_msgSend_capabilities(self, v121, v122, v123);
  objc_msgSend_encodeObject_forKey_(v5, v125, (uint64_t)v124, v126, @"capabilities");

  double v130 = objc_msgSend_familyEndpointData(self, v127, v128, v129);
  objc_msgSend_encodeObject_forKey_(v5, v131, (uint64_t)v130, v132, @"familyEndpointData");

  objc_msgSend_gameCenterData(self, v133, v134, v135);
  id v138 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v136, (uint64_t)v138, v137, @"gameCenterData");
}

- (IDSURI)URI
{
  return self->_URI;
}

- (void)setURI:(id)a3
{
}

- (void)setPushToken:(id)a3
{
}

- (IDSPushToken)pushTokenObject
{
  return self->_pushTokenObject;
}

- (void)setPublicDeviceIdentityContainer:(id)a3
{
}

- (void)setApplicationPublicDeviceIdentity:(__SecKey *)a3
{
  self->_applicationPublicDeviceIdentity = a3;
}

- (IDSEndpointCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (NSData)serializedNGMDeviceIdentity
{
  return self->_serializedNGMDeviceIdentity;
}

- (NSData)serializedLegacyPublicIdentity
{
  return self->_serializedLegacyPublicIdentity;
}

- (NSData)serializedNGMDevicePrekey
{
  return self->_serializedNGMDevicePrekey;
}

- (NSData)serializedApplicationPublicKey
{
  return self->_serializedApplicationPublicKey;
}

- (signed)ngmVersion
{
  return self->_ngmVersion;
}

- (char)legacyVersion
{
  return self->_legacyVersion;
}

- (NSError)identityContainerDeserializationError
{
  return self->_identityContainerDeserializationError;
}

- (NSData)KTLoggableData
{
  return self->_KTLoggableData;
}

- (NSData)KTDeviceSignature
{
  return self->_KTDeviceSignature;
}

- (BOOL)mismatchedAccountFlag
{
  return self->_mismatchedAccountFlag;
}

- (BOOL)ktCapableFlag
{
  return self->_ktCapableFlag;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (NSDate)refreshDate
{
  return self->_refreshDate;
}

- (NSString)anonymizedSenderID
{
  return self->_anonymizedSenderID;
}

- (BOOL)verifiedBusiness
{
  return self->_verifiedBusiness;
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (NSString)shortHandle
{
  return self->_shortHandle;
}

- (double)queryTimeInterval
{
  return self->_queryTimeInterval;
}

- (IDSFamilyEndpointData)familyEndpointData
{
  return self->_familyEndpointData;
}

- (IDSGameCenterData)gameCenterData
{
  return self->_gameCenterData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameCenterData, 0);
  objc_storeStrong((id *)&self->_familyEndpointData, 0);
  objc_storeStrong((id *)&self->_shortHandle, 0);
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_anonymizedSenderID, 0);
  objc_storeStrong((id *)&self->_refreshDate, 0);
  objc_storeStrong((id *)&self->_expireDate, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_KTDeviceSignature, 0);
  objc_storeStrong((id *)&self->_KTLoggableData, 0);
  objc_storeStrong((id *)&self->_identityContainerDeserializationError, 0);
  objc_storeStrong((id *)&self->_serializedApplicationPublicKey, 0);
  objc_storeStrong((id *)&self->_serializedNGMDevicePrekey, 0);
  objc_storeStrong((id *)&self->_serializedLegacyPublicIdentity, 0);
  objc_storeStrong((id *)&self->_serializedNGMDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_publicDeviceIdentityContainer, 0);
  objc_storeStrong((id *)&self->_pushTokenObject, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_URI, 0);
}

@end