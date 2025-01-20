@interface IDSMPFullDeviceIdentityContainerEncrypter
- (BOOL)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 withPublicDeviceIdentity:(id)a6 error:(id *)a7;
- (BOOL)verifySignedData:(id)a3 matchesData:(id)a4 withSecPublicDeviceIdentity:(__SecKey *)a5 diversifier:(id)a6 error:(id *)a7;
- (IDSMPFullDeviceIdentityContainerEncrypter)initWithRegistrationKeyManager:(id)a3;
- (IDSRegistrationKeyManager)registrationKeyManager;
- (id)_validateParametersWithFullIdentityToUse:(id)a3 fullIdentity:(id)a4 publicIdentity:(id)a5 inputData:(id)a6 identifier:(id)a7 forDecryption:(BOOL)a8;
- (id)batchSignDatas:(id)a3 withType:(int64_t)a4 error:(id *)a5;
- (id)decryptData:(id)a3 decryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7;
- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 error:(id *)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7;
- (id)encryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 withPublicDeviceIdentityContainer:(id)a8 usedIdentifier:(id *)a9 metadata:(id *)a10 error:(id *)a11;
- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6;
- (id)offGridKeyDistributionEncryptData:(id)a3 encryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6;
- (id)signData:(id)a3 usingApplicationKeyIndex:(unsigned __int16)a4 diversifier:(id)a5 error:(id *)a6;
- (id)signData:(id)a3 withSignatureType:(int64_t)a4 error:(id *)a5;
@end

@implementation IDSMPFullDeviceIdentityContainerEncrypter

- (IDSMPFullDeviceIdentityContainerEncrypter)initWithRegistrationKeyManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSMPFullDeviceIdentityContainerEncrypter;
  v6 = [(IDSMPFullDeviceIdentityContainerEncrypter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_registrationKeyManager, a3);
  }

  return v7;
}

- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(IDSRegistrationKeyManager *)self->_registrationKeyManager fullDeviceIdentityContainerUsableForKeyType:1];
  v14 = [(IDSRegistrationKeyManager *)self->_registrationKeyManager fullDeviceIdentityContainer];
  uint64_t v15 = IDSMPLegacyIdentityIdentifier;
  v16 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self _validateParametersWithFullIdentityToUse:v13 fullIdentity:v14 publicIdentity:v12 inputData:v10 identifier:IDSMPLegacyIdentityIdentifier forDecryption:0];
  if (v16)
  {
    v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v28 = v12;
      __int16 v29 = 2112;
      v30 = v13;
      __int16 v31 = 2048;
      id v32 = [v10 length];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid encryption parameters (using) -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v24 = [v10 length];
      _IDSWarnV();
      id v25 = objc_msgSend(v10, "length", v12, v13, v24);
      _IDSLogV();
      objc_msgSend(v10, "length", v12, v13, v25);
      _IDSLogTransport();
    }
    v18 = 0;
    if (a6) {
      *a6 = v16;
    }
  }
  else
  {
    v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v23 = v13;
      _IDSLogV();
    }
    id v26 = 0;
    v18 = objc_msgSend(v12, "legacySealMessage:withEncryptedAttributes:signedByFullIdentity:usingIdentitiesWithIdentifier:error:", v10, v11, v13, v15, &v26, v23);
    id v20 = v26;
    if (!v18)
    {
      v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "   Public/Private encryption failed with error: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      if (a6) {
        *a6 = v20;
      }
    }
  }

  return v18;
}

- (id)offGridKeyDistributionEncryptData:(id)a3 encryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6
{
  id v31 = a3;
  id v30 = a4;
  id v32 = a5;
  objc_super v9 = [(IDSRegistrationKeyManager *)self->_registrationKeyManager fullDeviceIdentityContainerUsableForKeyType:2];
  id v28 = [(IDSRegistrationKeyManager *)self->_registrationKeyManager fullDeviceIdentityContainer];
  id v29 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self _validateParametersWithFullIdentityToUse:v9 fullIdentity:v28 publicIdentity:v32 inputData:v31 identifier:IDSPaddyIdentityIdentifier forDecryption:0];
  if (v29)
  {
    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v35 = v32;
      __int16 v36 = 2112;
      v37 = v9;
      __int16 v38 = 2048;
      id v39 = [v31 length];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Invalid encryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu}", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v24 = [v31 length];
      _IDSWarnV();
      id v25 = objc_msgSend(v31, "length", v32, v9, v24);
      _IDSLogV();
      objc_msgSend(v31, "length", v32, v9, v25);
      _IDSLogTransport();
    }
    id v11 = 0;
    if (a6) {
      *a6 = v29;
    }
  }
  else
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v23 = v9;
      _IDSLogV();
    }
    id v26 = objc_msgSend(v30, "sendingURI", v23);
    v13 = [v26 prefixedURI];
    v14 = [v30 sendingPushToken];
    uint64_t v15 = [v14 rawToken];
    v16 = [v30 receivingURI];
    v17 = [v16 prefixedURI];
    v18 = [v30 receivingPushToken];
    v19 = [v18 rawToken];
    id v33 = 0;
    id v11 = [v32 sealPaddyMessage:v31 sendingURI:v13 sendingPushToken:v15 receivingURI:v17 receivingPushToken:v19 signedByFullIdentity:v9 error:&v33];
    id v20 = v33;

    if (!v11)
    {
      v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "   Paddy sender key encryption failed with error: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      if (a6) {
        *a6 = v20;
      }
    }
  }

  return v11;
}

- (id)encryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 withPublicDeviceIdentityContainer:(id)a8 usedIdentifier:(id *)a9 metadata:(id *)a10 error:(id *)a11
{
  id v63 = a3;
  id v62 = a4;
  id v59 = a7;
  id v16 = a8;
  v17 = [v16 ngmPublicDeviceIdentity];
  v18 = v17;
  if (v17) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 1;
  }

  id v20 = [(IDSRegistrationKeyManager *)self->_registrationKeyManager fullDeviceIdentityContainerUsableForKeyType:v19];
  v60 = [(IDSRegistrationKeyManager *)self->_registrationKeyManager fullDeviceIdentityContainer];
  v21 = (void *)IDSMPLegacyIdentityIdentifier;
  if (a9) {
    uint64_t v22 = IDSMPLegacyIdentityIdentifier;
  }
  else {
    uint64_t v22 = 0;
  }
  id v61 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self _validateParametersWithFullIdentityToUse:v20 fullIdentity:v60 publicIdentity:v16 inputData:v63 identifier:v22 forDecryption:0];
  if (v61)
  {
    v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v67 = v16;
      __int16 v68 = 2112;
      v69 = v20;
      __int16 v70 = 2048;
      id v71 = [v63 length];
      __int16 v72 = 2048;
      v73 = a9;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Invalid encryption parameters (used) -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v45 = [v63 length];
      _IDSWarnV();
      id v46 = objc_msgSend(v63, "length", v16, v20, v45, a9);
      _IDSLogV();
      objc_msgSend(v63, "length", v16, v20, v46, a9);
      _IDSLogTransport();
    }
    if (a11) {
      *a11 = v61;
    }
    id v24 = 0;
    if (a9 && !v20)
    {
      if (v18) {
        id v25 = (void *)IDSNGMDeviceIdentityIdentifier;
      }
      else {
        id v25 = v21;
      }
      id v24 = 0;
      *a9 = v25;
    }
  }
  else
  {
    id v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v20;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v40 = v20;
      _IDSLogV();
    }
    v54 = objc_msgSend(v62, "guid", v40);
    v58 = [v62 sendingURI];
    v57 = [v62 sendingPushToken];
    v56 = [v62 receivingURI];
    v55 = [v62 receivingPushToken];
    v53 = [v62 authenticatedData];
    id v27 = [v62 messageType];
    id v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413826;
      id v67 = v54;
      __int16 v68 = 2112;
      v69 = v58;
      __int16 v70 = 2112;
      id v71 = v57;
      __int16 v72 = 2112;
      v73 = v56;
      __int16 v74 = 2112;
      v75 = v55;
      __int16 v76 = 2112;
      v77 = v53;
      __int16 v78 = 2048;
      id v79 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Calling into sealMessage with {guid:%@, sendingURI:%@, sendingPushToken:%@, receivingURI:%@, receivingPushToken:%@, authenticatedData:%@, messageType:%ld}", buf, 0x48u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v50 = v53;
      id v51 = v27;
      v48 = v56;
      v49 = v55;
      v43 = v58;
      v44 = v57;
      v41 = v54;
      _IDSLogV();
    }
    id v29 = objc_msgSend(v58, "prefixedURI", v41, v43, v44, v48, v49, v50, v51);
    id v30 = [v57 rawToken];
    id v31 = [v56 prefixedURI];
    id v32 = [v55 rawToken];
    id v64 = 0;
    id v65 = 0;
    BYTE1(v47) = a6;
    LOBYTE(v47) = a5;
    id v24 = objc_msgSend(v16, "sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:withEncryptedAttributes:signedByFullIdentity:usedIdentityWithIdentifier:error:additionalResult:", v63, v53, v27, v54, v29, v30, v31, v32, v47, v59, v20, a9, &v65, &v64);
    id v33 = v65;
    id v34 = v64;

    id v35 = [[IDSEncryptionMetadata alloc] initWithAdditionalEncryptionResult:v34];
    __int16 v36 = v35;
    if (a10) {
      *a10 = v35;
    }
    if (!v24)
    {
      v37 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v33;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "   Public/Private encryption failed with error: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v42 = v33;
        _IDSLogV();
      }
      if (a11) {
        *a11 = v33;
      }
      if (objc_msgSend(*a9, "isEqualToString:", IDSNGMDeviceIdentityIdentifier, v42))
      {
        __int16 v38 = +[IMIDSLog encryption];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_10070AC90((uint64_t)v33, v38);
        }
      }
    }
  }

  return v24;
}

- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 error:(id *)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = [(IDSRegistrationKeyManager *)self->_registrationKeyManager fullDeviceIdentityContainer];
  uint64_t v15 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self _validateParametersWithFullIdentityToUse:v14 fullIdentity:0 publicIdentity:v12 inputData:v11 identifier:v13 forDecryption:1];
  if (v15)
  {
    id v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v33 = v12;
      __int16 v34 = 2112;
      id v35 = v14;
      __int16 v36 = 2048;
      id v37 = [v11 length];
      __int16 v38 = 2048;
      id v39 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Invalid decryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v28 = [v11 length];
      _IDSWarnV();
      id v29 = objc_msgSend(v11, "length", v12, v14, v28, v13);
      _IDSLogV();
      objc_msgSend(v11, "length", v12, v14, v29, v13);
      _IDSLogTransport();
    }
    v17 = 0;
    if (a5) {
      *a5 = v15;
    }
  }
  else
  {
    v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v25 = v14;
      _IDSLogV();
    }
    id v31 = 0;
    v17 = objc_msgSend(v14, "unsealMessage:signedByPublicIdentity:usingIdentityWithIdentifier:error:", v11, v12, v13, &v31, v25);
    id v19 = v31;
    if (v17)
    {
      id v20 = v14;
    }
    else
    {
      v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "   Public/Private decryption failed with error: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v26 = v19;
        _IDSLogV();
      }
      id v20 = [(IDSRegistrationKeyManager *)self->_registrationKeyManager previousFullDeviceIdentityContainer];

      if (v20)
      {
        uint64_t v22 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v20;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Using previous full identity: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v27 = v20;
          _IDSLogV();
        }
        id v30 = 0;
        v17 = objc_msgSend(v20, "unsealMessage:signedByPublicIdentity:usingIdentityWithIdentifier:error:", v11, v12, v13, &v30, v27);
        id v23 = v30;
        if (a5 && !v17) {
          *a5 = v19;
        }
      }
      else
      {
        id v20 = 0;
        v17 = 0;
        if (a5) {
          *a5 = v19;
        }
      }
    }

    v14 = v20;
  }

  return v17;
}

- (id)decryptData:(id)a3 decryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7
{
  id v38 = a3;
  id v37 = a4;
  id v39 = a5;
  id v11 = a6;
  id v35 = self->_registrationKeyManager;
  id v12 = [(IDSRegistrationKeyManager *)v35 fullDeviceIdentityContainer];
  __int16 v36 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self _validateParametersWithFullIdentityToUse:v12 fullIdentity:0 publicIdentity:v39 inputData:v38 identifier:v11 forDecryption:1];
  if (v36)
  {
    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v48 = v39;
      __int16 v49 = 2112;
      v50 = v12;
      __int16 v51 = 2048;
      id v52 = [v38 length];
      __int16 v53 = 2048;
      id v54 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid decryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v28 = [v38 length];
      _IDSWarnV();
      id v29 = objc_msgSend(v38, "length", v39, v12, v28, v11);
      _IDSLogV();
      objc_msgSend(v38, "length", v39, v12, v29, v11);
      _IDSLogTransport();
    }
    id v14 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
    [v14 failWithError:v36];
    uint64_t v15 = [v14 promise];
  }
  else
  {
    id v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v27 = v12;
      _IDSLogV();
    }
    objc_msgSend(v37, "guid", v27);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v34 = [v37 sendingURI];
    id v33 = [v37 sendingPushToken];
    id v32 = [v37 receivingURI];
    id v31 = [v37 receivingPushToken];
    id v30 = [v37 authenticatedData];
    id v17 = [v37 messageType];
    v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413826;
      id v48 = v14;
      __int16 v49 = 2112;
      v50 = v34;
      __int16 v51 = 2112;
      id v52 = v33;
      __int16 v53 = 2112;
      id v54 = v32;
      __int16 v55 = 2112;
      v56 = v31;
      __int16 v57 = 2112;
      v58 = v30;
      __int16 v59 = 2048;
      id v60 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling into unsealMessage with {guid:%@, sendingURI:%@, sendingPushToken:%@, receivingURI:%@, receivingPushToken:%@, authenticatedData:%@, messageType:%ld}", buf, 0x48u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v19 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
    id v20 = [v34 prefixedURI];
    v21 = [v33 rawToken];
    uint64_t v22 = [v32 prefixedURI];
    id v23 = [v31 rawToken];
    id v24 = [v12 unsealMessage:v38 authenticatedData:v30 messageType:v17 guid:v14 sendingURI:v20 sendingPushToken:v21 receivingURI:v22 receivingPushToken:v23 signedByPublicIdentity:v39 usingIdentityWithIdentifier:v11];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10004954C;
    v40[3] = &unk_10097FC38;
    v41 = v35;
    id v42 = v19;
    id v43 = v38;
    id v44 = v37;
    id v45 = v39;
    id v46 = v11;
    id v25 = v19;
    [v24 registerResultBlock:v40];

    uint64_t v15 = [v25 promise];
  }

  return v15;
}

- (id)_validateParametersWithFullIdentityToUse:(id)a3 fullIdentity:(id)a4 publicIdentity:(id)a5 inputData:(id)a6 identifier:(id)a7 forDecryption:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = (id *)&IDSDecryptionErrorDomain;
  if (!v8) {
    v18 = (id *)&IDSEncryptionErrorDomain;
  }
  id v19 = *v18;
  if (!v13)
  {
    BOOL v21 = !v8;
    if (v14) {
      uint64_t v22 = 20;
    }
    else {
      uint64_t v22 = 16;
    }
    uint64_t v23 = 6;
    goto LABEL_15;
  }
  if (!v15)
  {
    BOOL v21 = !v8;
    uint64_t v22 = 17;
    uint64_t v23 = 4;
LABEL_15:
    if (v21) {
      uint64_t v24 = v22;
    }
    else {
      uint64_t v24 = v23;
    }
    id v20 = +[NSError errorWithDomain:v19 code:v24 userInfo:0];
    goto LABEL_19;
  }
  if (![v16 length])
  {
    BOOL v21 = !v8;
    uint64_t v22 = 18;
    uint64_t v23 = 7;
    goto LABEL_15;
  }
  if (!v17)
  {
    BOOL v21 = !v8;
    uint64_t v22 = 19;
    uint64_t v23 = 8;
    goto LABEL_15;
  }
  id v20 = 0;
LABEL_19:

  return v20;
}

- (id)signData:(id)a3 withSignatureType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  objc_super v9 = [(IDSRegistrationKeyManager *)self->_registrationKeyManager fullDeviceIdentityContainer];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 ngmFullDeviceIdentity];
    id v18 = 0;
    id v12 = [v11 sign:v8 forType:a4 error:&v18];
    id v13 = v18;

    if (a5 && !v12)
    {
      if (v13)
      {
        NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
        id v22 = v13;
        id v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        id v15 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MessageProtection Error signing data: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v17 = v13;
          _IDSLogV();
        }
      }
      else
      {
        id v14 = 0;
      }
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IDSSigningErrorDomain, 12, v14, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a5)
  {
    +[NSError errorWithDomain:IDSSigningErrorDomain code:11 userInfo:0];
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)signData:(id)a3 usingApplicationKeyIndex:(unsigned __int16)a4 diversifier:(id)a5 error:(id *)a6
{
  uint64_t v8 = a4;
  CFDataRef dataToSign = (const __CFData *)a3;
  id v10 = a5;
  if (![(IDSRegistrationKeyManager *)self->_registrationKeyManager fullIdentityForKeyIndex:v8]|| (CFTypeRef v11 = CFRetain([(IDSRegistrationKeyManager *)self->_registrationKeyManager fullIdentityForKeyIndex:v8])) == 0)
  {
    if (a6)
    {
      +[NSError errorWithDomain:IDSSigningErrorDomain code:11 userInfo:0];
      CFDataRef v25 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  id v12 = (void *)v11;
  if (!v10)
  {
    if (a6)
    {
      *a6 = +[NSError errorWithDomain:IDSSigningErrorDomain code:15 userInfo:0];
    }
    id v29 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No diversifier supplied for an application key. Failing...", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    CFRelease(v12);
    goto LABEL_39;
  }
  if (qword_100A4A388 != -1) {
    dispatch_once(&qword_100A4A388, &stru_10097FC58);
  }
  id v13 = (void *)qword_100A4A380;
  id v14 = [v10 diversifier];
  id v15 = [v10 trackingPreventionSecret];
  id v37 = 0;
  id v16 = [v13 diversifyPrivateKey:v12 withDocumentIdentifier:v14 trackingPreventionSalt:v15 error:&v37];
  id v17 = v37;
  if (!v16)
  {

    if (!v17) {
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  id v18 = (void *)qword_100A4A380;
  id v19 = [v10 diversifier];
  id v20 = [v10 trackingPreventionSecret];
  id v36 = v17;
  id v21 = [v18 diversifyPrivateKey:v12 withDocumentIdentifier:v19 trackingPreventionSalt:v20 error:&v36];
  id v22 = v36;

  uint64_t v23 = (__SecKey *)CFRetain(v21);
  if (!v23)
  {
    id v17 = v22;
    if (!v22)
    {
LABEL_31:
      id v30 = 0;
      if (!a6)
      {
LABEL_33:
        id v31 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          CFErrorRef v41 = (CFErrorRef)v12;
          __int16 v42 = 2112;
          id v43 = v10;
          __int16 v44 = 2112;
          id v45 = v17;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed to diversify key for signing { tempIdentity: %@, diversifier: %@, mpError: %@ }", buf, 0x20u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        CFRelease(v12);

LABEL_39:
        CFDataRef v25 = 0;
        goto LABEL_40;
      }
LABEL_32:
      *a6 = +[NSError errorWithDomain:IDSSigningErrorDomain code:15 userInfo:v30];
      goto LABEL_33;
    }
LABEL_28:
    NSErrorUserInfoKey v46 = NSUnderlyingErrorKey;
    id v47 = v17;
    id v30 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    if (!a6) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  CFRelease(v12);

  CFErrorRef error = 0;
  CFDataRef v24 = SecKeyCreateSignature(v23, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, dataToSign, &error);
  CFDataRef v25 = v24;
  CFErrorRef v26 = error;
  if (!a6 || v24)
  {
    if (error)
    {
      CFRelease(error);
      CFErrorRef error = 0;
    }
  }
  else
  {
    if (error)
    {
      NSErrorUserInfoKey v38 = NSUnderlyingErrorKey;
      CFErrorRef v39 = error;
      id v27 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id v28 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v41 = v26;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Security Error signing data: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        CFErrorRef v33 = v26;
        _IDSLogV();
      }
    }
    else
    {
      id v27 = 0;
    }
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IDSSigningErrorDomain, 13, v27, v33);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  CFRelease(v23);
LABEL_40:

  return v25;
}

- (id)batchSignDatas:(id)a3 withType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  objc_super v9 = [(IDSRegistrationKeyManager *)self->_registrationKeyManager fullDeviceIdentityContainer];
  id v10 = v9;
  if (v9)
  {
    CFTypeRef v11 = [v9 ngmFullDeviceIdentity];
    id v19 = 0;
    id v12 = [v11 batchSign:v8 forType:a4 error:&v19];
    id v13 = v19;

    id v14 = [v12 count];
    if (a5 && !v14)
    {
      if (v13)
      {
        NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
        id v23 = v13;
        id v15 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        id v16 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v13;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "MessageProtection Error signing data: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v18 = v13;
          _IDSLogV();
        }
      }
      else
      {
        id v15 = 0;
      }
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IDSSigningErrorDomain, 12, v15, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a5)
  {
    +[NSError errorWithDomain:IDSSigningErrorDomain code:11 userInfo:0];
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 withPublicDeviceIdentity:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    id v23 = 0;
    unsigned __int8 v15 = [v13 isValidSignature:v11 forMessage:v12 forType:a5 error:&v23];
    id v16 = v23;
    id v17 = v16;
    if (a7) {
      char v18 = v15;
    }
    else {
      char v18 = 1;
    }
    if ((v18 & 1) == 0)
    {
      if (v16)
      {
        NSErrorUserInfoKey v26 = NSUnderlyingErrorKey;
        id v27 = v16;
        id v19 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        id v20 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFDataRef v25 = v17;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "MessageProtection Error verifying signing data: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          NSErrorUserInfoKey v22 = v17;
          _IDSLogV();
        }
      }
      else
      {
        id v19 = 0;
      }
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IDSSigningErrorDomain, 12, v19, v22);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a7)
  {
    +[NSError errorWithDomain:IDSSigningErrorDomain code:10 userInfo:0];
    unsigned __int8 v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (BOOL)verifySignedData:(id)a3 matchesData:(id)a4 withSecPublicDeviceIdentity:(__SecKey *)a5 diversifier:(id)a6 error:(id *)a7
{
  CFDataRef v11 = (const __CFData *)a3;
  CFDataRef v12 = (const __CFData *)a4;
  id v13 = a6;
  id v14 = v13;
  if (!a5)
  {
    if (a7)
    {
      id v15 = +[NSError errorWithDomain:IDSSigningErrorDomain code:10 userInfo:0];
      goto LABEL_7;
    }
LABEL_8:
    BOOL v16 = 0;
    goto LABEL_23;
  }
  if (v13)
  {
    if (a7)
    {
      id v15 = +[NSError errorWithDomain:IDSSigningErrorDomain code:15 userInfo:0];
LABEL_7:
      BOOL v16 = 0;
      *a7 = v15;
      goto LABEL_23;
    }
    goto LABEL_8;
  }
  CFErrorRef error = 0;
  int v17 = SecKeyVerifySignature(a5, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v11, v12, &error);
  CFErrorRef v18 = error;
  if (!a7 || v17)
  {
    if (error) {
      CFRelease(error);
    }
  }
  else
  {
    if (error)
    {
      NSErrorUserInfoKey v26 = NSUnderlyingErrorKey;
      CFErrorRef v27 = error;
      id v19 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v20 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Security Error verifying signing data: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        CFErrorRef v22 = v18;
        _IDSLogV();
      }
    }
    else
    {
      id v19 = 0;
    }
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IDSSigningErrorDomain, 13, v19, v22);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
}

- (IDSRegistrationKeyManager)registrationKeyManager
{
  return self->_registrationKeyManager;
}

- (void).cxx_destruct
{
}

@end