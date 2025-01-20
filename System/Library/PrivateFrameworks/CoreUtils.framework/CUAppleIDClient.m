@interface CUAppleIDClient
- (BOOL)_validatePeerHashes:(id)a3;
- (BOOL)validatePeerWithFlags:(unsigned int)a3 error:(id *)a4;
- (BOOL)verifyBytes:(const void *)a3 verifyLength:(unint64_t)a4 signatureBytes:(const void *)a5 signatureLength:(unint64_t)a6 error:(id *)a7;
- (BOOL)verifyData:(id)a3 signature:(id)a4 error:(id *)a5;
- (CUAppleIDClient)myInfoClient;
- (NSArray)peerAppleIDs;
- (NSData)myCertificateData;
- (NSData)mySecretKeyData;
- (NSData)peerCertificateData;
- (NSData)peerValidationData;
- (NSString)myAppleID;
- (NSString)mySecretKeyType;
- (NSString)peerAppleID;
- (__SecCertificate)_getMyCertificateAndReturnError:(id *)a3;
- (__SecCertificate)_getPeerCertificateAndReturnError:(id *)a3;
- (__SecIdentity)_getMyIdentityAndReturnError:(id *)a3;
- (__SecKey)_getMySecretKeyAndReturnError:(id *)a3;
- (__SecKey)_getPeerPublicKeyAndReturnError:(id *)a3;
- (id)copyMyAppleIDAndReturnError:(id *)a3;
- (id)copyMyCertificateDataAndReturnError:(id *)a3;
- (id)copyMyValidationDataAndReturnError:(id *)a3;
- (id)signBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (id)signData:(id)a3 error:(id *)a4;
- (int)securityLevel;
- (void)dealloc;
- (void)setMyAppleID:(id)a3;
- (void)setMyCertificateData:(id)a3;
- (void)setMyInfoClient:(id)a3;
- (void)setMySecretKeyData:(id)a3;
- (void)setMySecretKeyType:(id)a3;
- (void)setPeerAppleID:(id)a3;
- (void)setPeerAppleIDs:(id)a3;
- (void)setPeerCertificateData:(id)a3;
- (void)setPeerValidationData:(id)a3;
@end

@implementation CUAppleIDClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mySecretKeyType, 0);
  objc_storeStrong((id *)&self->_mySecretKeyData, 0);
  objc_storeStrong((id *)&self->_myCertificateData, 0);
  objc_storeStrong((id *)&self->_peerValidationData, 0);
  objc_storeStrong((id *)&self->_peerCertificateData, 0);
  objc_storeStrong((id *)&self->_peerAppleIDs, 0);
  objc_storeStrong((id *)&self->_peerAppleID, 0);
  objc_storeStrong((id *)&self->_myInfoClient, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_peerValidationDict, 0);
  objc_storeStrong((id *)&self->_myValidationData, 0);
}

- (void)setMySecretKeyType:(id)a3
{
}

- (NSString)mySecretKeyType
{
  return self->_mySecretKeyType;
}

- (void)setMySecretKeyData:(id)a3
{
}

- (NSData)mySecretKeyData
{
  return self->_mySecretKeyData;
}

- (void)setMyCertificateData:(id)a3
{
}

- (NSData)myCertificateData
{
  return self->_myCertificateData;
}

- (void)setPeerValidationData:(id)a3
{
}

- (NSData)peerValidationData
{
  return self->_peerValidationData;
}

- (void)setPeerCertificateData:(id)a3
{
}

- (NSData)peerCertificateData
{
  return self->_peerCertificateData;
}

- (void)setPeerAppleIDs:(id)a3
{
}

- (NSArray)peerAppleIDs
{
  return self->_peerAppleIDs;
}

- (NSString)peerAppleID
{
  return self->_peerAppleID;
}

- (void)setMyInfoClient:(id)a3
{
}

- (CUAppleIDClient)myInfoClient
{
  return self->_myInfoClient;
}

- (void)setMyAppleID:(id)a3
{
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (int)securityLevel
{
  int securityLevel = self->_securityLevel;
  if (!securityLevel)
  {
    if (AppleAccountLibrary_sOnce != -1) {
      dispatch_once(&AppleAccountLibrary_sOnce, &__block_literal_global_155);
    }
    id v4 = objc_alloc_init(getACAccountStoreClass());
    v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
    v6 = [v5 accountPropertyForKey:@"altDSID"];
    if (v6)
    {
      v7 = [(Class)getAKAccountManagerClass[0]() sharedInstance];
      v8 = [v7 authKitAccountWithAltDSID:v6 error:0];
      if (v8)
      {
        int securityLevel = [v7 securityLevelForAccount:v8];
        self->_int securityLevel = securityLevel;
      }
      else
      {
        int securityLevel = 0;
      }
    }
    else
    {
      int securityLevel = 0;
    }
  }
  return securityLevel;
}

- (__SecKey)_getPeerPublicKeyAndReturnError:(id *)a3
{
  result = self->_peerPublicKey;
  if (!result)
  {
    result = -[CUAppleIDClient _getPeerCertificateAndReturnError:](self, "_getPeerCertificateAndReturnError:");
    if (result)
    {
      result = SecCertificateCopyKey(result);
      self->_peerPublicKey = result;
      if (a3)
      {
        if (!result)
        {
          NSErrorWithOSStatusF(4294960596, (uint64_t)"Get peer public key from certificate failed", v6, v7, v8, v9, v10, v11, v12);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          return self->_peerPublicKey;
        }
      }
    }
  }
  return result;
}

- (__SecCertificate)_getPeerCertificateAndReturnError:(id *)a3
{
  peerCertificate = self->_peerCertificate;
  if (!peerCertificate)
  {
    uint64_t v12 = self->_peerCertificateData;
    if (v12)
    {
      v13 = SecCertificateCreateWithData(0, (CFDataRef)v12);
      peerCertificate = v13;
      self->_peerCertificate = v13;
      if (a3 && !v13)
      {
        NSErrorWithOSStatusF(4294960596, (uint64_t)"Import peer certificate failed", v14, v15, v16, v17, v18, v19, v21);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        peerCertificate = self->_peerCertificate;
      }
    }
    else if (a3)
    {
      NSErrorWithOSStatusF(4294960569, (uint64_t)"No peer certificate data", v6, v7, v8, v9, v10, v11, v21);
      peerCertificate = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      peerCertificate = 0;
    }
  }
  return peerCertificate;
}

- (id)copyMyValidationDataAndReturnError:(id *)a3
{
  myInfoClient = self->_myInfoClient;
  if (myInfoClient)
  {
    return -[CUAppleIDClient copyMyValidationDataAndReturnError:](myInfoClient, "copyMyValidationDataAndReturnError:");
  }
  myValidationData = self->_myValidationData;
  if (!myValidationData)
  {
    id v8 = [(CUAppleIDClient *)self copyMyAppleIDAndReturnError:a3];
    if (!v8)
    {
      v28 = 0;
LABEL_22:

      return v28;
    }
    id v31 = 0;
    uint64_t v9 = getkAppleIDValidatedItemsRecordDataCertificateType[0]();
    CFDictionaryRef v16 = (const __CFDictionary *)((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLink_AppleIDAuthenticationCopyCertificateInfo[0])((uint64_t)v8, v9, 0, (uint64_t)&v31);
    id v17 = v31;
    if (v16)
    {
      CFTypeID TypeID = CFDataGetTypeID();
      CFDictionaryGetTypedValue(v16, @"AppleIDAccountValidationRecordData", TypeID, 0);
      uint64_t v19 = (NSData *)objc_claimAutoreleasedReturnValue();
      v20 = self->_myValidationData;
      self->_myValidationData = v19;

      v27 = self->_myValidationData;
      if (a3 && !v27)
      {
        NSErrorWithOSStatusF(4294960569, (uint64_t)"Get AppleID validation record data failed", v21, v22, v23, v24, v25, v26, v30);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        v27 = self->_myValidationData;
      }
      v28 = (void *)[(NSData *)v27 copy];
      goto LABEL_21;
    }
    if (a3)
    {
      if (v31)
      {
        v28 = 0;
        *a3 = v31;
LABEL_21:

        goto LABEL_22;
      }
      NSErrorWithOSStatusF(4294960569, (uint64_t)"Get AppleID certificate info failed", v10, v11, v12, v13, v14, v15, v30);
      id v29 = objc_claimAutoreleasedReturnValue();
      *a3 = v29;
    }
    v28 = 0;
    goto LABEL_21;
  }
  return myValidationData;
}

- (__SecKey)_getMySecretKeyAndReturnError:(id *)a3
{
  v39[2] = *MEMORY[0x1E4F143B8];
  myInfoClient = self->_myInfoClient;
  if (!myInfoClient)
  {
    p_mySecretKey = &self->_mySecretKey;
    mySecretKey = self->_mySecretKey;
    if (!mySecretKey)
    {
      if (self->_mySecretKeyData)
      {
        uint64_t v9 = self->_mySecretKeyType;
        CFDictionaryRef v16 = v9;
        if (v9)
        {
          uint64_t v17 = *MEMORY[0x1E4F3B6E8];
          uint64_t v18 = *MEMORY[0x1E4F3B718];
          v38[0] = *MEMORY[0x1E4F3B6D8];
          v38[1] = v18;
          v39[0] = v17;
          v39[1] = v9;
          CFDictionaryRef v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
          id v37 = 0;
          v20 = SecKeyCreateWithData((CFDataRef)self->_mySecretKeyData, v19, (CFErrorRef *)&v37);
          self->_mySecretKey = v20;
          id v27 = v37;
          if (a3 && !v20)
          {
            if (v37)
            {
              *a3 = v37;
            }
            else
            {
              NSErrorWithOSStatusF(4294960596, (uint64_t)"Import secret key failed", v21, v22, v23, v24, v25, v26, 0);
              id v36 = objc_claimAutoreleasedReturnValue();
              *a3 = v36;
            }
          }
          mySecretKey = *p_mySecretKey;
        }
        else if (a3)
        {
          NSErrorWithOSStatusF(4294960591, (uint64_t)"Secret key data without type", v10, v11, v12, v13, v14, v15, (uint64_t)v37);
          mySecretKey = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          mySecretKey = 0;
        }

        return mySecretKey;
      }
      v28 = [(CUAppleIDClient *)self _getMyIdentityAndReturnError:a3];
      if (v28)
      {
        uint64_t v29 = SecIdentityCopyPrivateKey(v28, &self->_mySecretKey);
        if (v29)
        {
          if (!a3) {
            return *p_mySecretKey;
          }
        }
        else
        {
          if (!a3 || *p_mySecretKey) {
            return *p_mySecretKey;
          }
          uint64_t v29 = 4294960596;
        }
        NSErrorWithOSStatusF(v29, (uint64_t)"Get AppleID key failed", v30, v31, v32, v33, v34, v35, (uint64_t)v37);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        return *p_mySecretKey;
      }
      return 0;
    }
    return mySecretKey;
  }
  return -[CUAppleIDClient _getMySecretKeyAndReturnError:](myInfoClient, "_getMySecretKeyAndReturnError:");
}

- (__SecIdentity)_getMyIdentityAndReturnError:(id *)a3
{
  myInfoClient = self->_myInfoClient;
  if (myInfoClient)
  {
    return -[CUAppleIDClient _getMyIdentityAndReturnError:](myInfoClient, "_getMyIdentityAndReturnError:");
  }
  else
  {
    myIdentity = self->_myIdentity;
    if (!myIdentity)
    {
      if (self->_mySecretKey || self->_mySecretKeyData)
      {
        if ([(CUAppleIDClient *)self _getMyCertificateAndReturnError:a3]
          && [(CUAppleIDClient *)self _getMySecretKeyAndReturnError:a3])
        {
          id v8 = (__SecIdentity *)SecIdentityCreate();
          myIdentity = v8;
          self->_myIdentity = v8;
          if (a3 && !v8)
          {
            NSErrorWithOSStatusF(4294960596, (uint64_t)"Import my identity failed", v9, v10, v11, v12, v13, v14, v26);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
            return self->_myIdentity;
          }
        }
        else
        {
          return 0;
        }
      }
      else
      {
        id v15 = [(CUAppleIDClient *)self copyMyAppleIDAndReturnError:a3];
        CFDictionaryRef v16 = v15;
        if (v15)
        {
          id v27 = 0;
          uint64_t v17 = (__SecIdentity *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLink_AppleIDCopySecIdentityForAppleIDAccount[0])((uint64_t)v15, 0, (uint64_t)&v27);
          self->_myIdentity = v17;
          id v24 = v27;
          if (a3 && !v17)
          {
            if (v27)
            {
              *a3 = v27;
            }
            else
            {
              NSErrorWithOSStatusF(4294960569, (uint64_t)"Get AppleID identity failed", v18, v19, v20, v21, v22, v23, v26);
              id v25 = objc_claimAutoreleasedReturnValue();
              *a3 = v25;
            }
          }
          myIdentity = self->_myIdentity;
        }
        else
        {
          myIdentity = 0;
        }
      }
    }
    return myIdentity;
  }
}

- (id)copyMyCertificateDataAndReturnError:(id *)a3
{
  myInfoClient = self->_myInfoClient;
  if (myInfoClient)
  {
    return -[CUAppleIDClient copyMyCertificateDataAndReturnError:](myInfoClient, "copyMyCertificateDataAndReturnError:");
  }
  else
  {
    myCertificateData = self->_myCertificateData;
    if (myCertificateData)
    {
      return myCertificateData;
    }
    else
    {
      id result = [(CUAppleIDClient *)self _getMyCertificateAndReturnError:a3];
      if (result)
      {
        id v8 = (NSData *)SecCertificateCopyData((SecCertificateRef)result);
        uint64_t v9 = self->_myCertificateData;
        self->_myCertificateData = v8;

        CFDictionaryRef v16 = self->_myCertificateData;
        if (a3 && !v16)
        {
          NSErrorWithOSStatusF(4294960596, (uint64_t)"Copy my certificate data failed", v10, v11, v12, v13, v14, v15, v17);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          CFDictionaryRef v16 = self->_myCertificateData;
        }
        return (id)[(NSData *)v16 copy];
      }
    }
  }
  return result;
}

- (__SecCertificate)_getMyCertificateAndReturnError:(id *)a3
{
  myInfoClient = self->_myInfoClient;
  if (!myInfoClient)
  {
    p_myCertificate = &self->_myCertificate;
    id result = self->_myCertificate;
    if (result) {
      return result;
    }
    myCertificateData = self->_myCertificateData;
    if (myCertificateData)
    {
      id result = SecCertificateCreateWithData(0, (CFDataRef)myCertificateData);
      *p_myCertificate = result;
      if (!a3 || result) {
        return result;
      }
      uint64_t v15 = "Import my certificate failed";
      uint64_t v16 = 4294960596;
    }
    else
    {
      id result = [(CUAppleIDClient *)self _getMyIdentityAndReturnError:a3];
      if (!result) {
        return result;
      }
      uint64_t v16 = SecIdentityCopyCertificate(result, p_myCertificate);
      if (v16)
      {
        if (!a3) {
          return *p_myCertificate;
        }
      }
      else
      {
        if (!a3 || *p_myCertificate) {
          return *p_myCertificate;
        }
        uint64_t v16 = 4294960596;
      }
      uint64_t v15 = "Get AppleID identity certificate failed";
    }
    NSErrorWithOSStatusF(v16, (uint64_t)v15, v9, v10, v11, v12, v13, v14, v17);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return *p_myCertificate;
  }
  return -[CUAppleIDClient _getMyCertificateAndReturnError:](myInfoClient, "_getMyCertificateAndReturnError:");
}

- (id)copyMyAppleIDAndReturnError:(id *)a3
{
  myInfoClient = self->_myInfoClient;
  if (myInfoClient)
  {
    return -[CUAppleIDClient copyMyAppleIDAndReturnError:](myInfoClient, "copyMyAppleIDAndReturnError:");
  }
  else
  {
    myAppleID = self->_myAppleID;
    if (myAppleID)
    {
      return myAppleID;
    }
    else
    {
      if (AppleAccountLibrary_sOnce != -1) {
        dispatch_once(&AppleAccountLibrary_sOnce, &__block_literal_global_155);
      }
      id v8 = objc_alloc_init(getACAccountStoreClass());
      uint64_t v9 = objc_msgSend(v8, "aa_primaryAppleAccount");
      uint64_t v10 = [v9 username];
      uint64_t v11 = self->_myAppleID;
      self->_myAppleID = v10;

      uint64_t v18 = self->_myAppleID;
      if (a3 && !v18)
      {
        NSErrorWithOSStatusF(4294960569, (uint64_t)"Get AppleID failed", v12, v13, v14, v15, v16, v17, v20);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = self->_myAppleID;
      }
      uint64_t v19 = (void *)[(NSString *)v18 copy];

      return v19;
    }
  }
}

- (BOOL)verifyBytes:(const void *)a3 verifyLength:(unint64_t)a4 signatureBytes:(const void *)a5 signatureLength:(unint64_t)a6 error:(id *)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (gLogCategory_CUAppleIDClient <= 30
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient verifyBytes:verifyLength:signatureBytes:signatureLength:error:]", 0x1Eu, (uint64_t)"Verify signature (%zu bytes data, %zu bytes signature)\n", (uint64_t)a5, a6, (uint64_t)a7, v7, a4);
  }
  uint64_t v14 = [(CUAppleIDClient *)self _getPeerPublicKeyAndReturnError:a7];
  if (!v14) {
    return 0;
  }
  uint64_t v15 = v14;
  long long v44 = 0u;
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v27 = _kCryptoHashDescriptor_SHA512;
  _SHA512Init((uint64_t)&v27);
  _SHA512Update((uint64_t)&v27, a3, a4);
  _SHA512Final((uint64_t)&v27, signedData);
  uint64_t v16 = SecKeyRawVerify(v15, 1u, signedData, 0x40uLL, (const uint8_t *)a5, a6);
  BOOL v23 = v16 == 0;
  if (v16)
  {
    if (a7)
    {
      NSErrorWithOSStatusF(v16, (uint64_t)"Verify data signature failed", v17, v18, v19, v20, v21, v22, v25);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    self->_peerSignatureVerified = 1;
  }
  return v23;
}

- (BOOL)verifyData:(id)a3 signature:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  uint64_t v12 = [v10 length];

  id v13 = v9;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];

  return [(CUAppleIDClient *)self verifyBytes:v11 verifyLength:v12 signatureBytes:v14 signatureLength:v15 error:a5];
}

- (BOOL)_validatePeerHashes:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v73 = (const __CFDictionary *)a3;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obj = self->_peerAppleIDs;
  uint64_t v72 = [(NSArray *)obj countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (v72)
  {
    uint64_t v71 = *(void *)v90;
LABEL_3:
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v90 != v71) {
        objc_enumerationMutation(obj);
      }
      v74 = *(void **)(*((void *)&v89 + 1) + 8 * v4);
      uint64_t v75 = v4;
      id v76 = [v74 lowercaseString];
      v5 = (char *)[v76 UTF8String];
      CC_LONG v6 = strlen(v5);
      CC_SHA256(v5, v6, md);
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];
      if (gLogCategory_CUAppleIDClient <= 30
        && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Validating peer hash: %@\n", v7, v8, v9, v10, (uint64_t)v11);
      }
      CFTypeID TypeID = CFArrayGetTypeID();
      id v13 = CFDictionaryGetTypedValue(v73, @"ValidatedEmailHashes", TypeID, 0);
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v85 objects:v95 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v86;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v86 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = NSDataWithHex((char *)[v19 UTF8String], -1, 22, 0, 0);
              if (gLogCategory_CUAppleIDClient <= 30
                && (gLogCategory_CUAppleIDClient != -1
                 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
              {
                LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Attempting match against: %@\n", v20, v21, v22, v23, (uint64_t)v24);
              }
              char v25 = [v24 isEqual:v11];

              if (v25)
              {
                LODWORD(v35) = 1;
                id v36 = v14;
                goto LABEL_69;
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v85 objects:v95 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      if (strchr(v5, 64))
      {
        uint64_t v26 = v74;
        id v27 = CUNormalizeEmailAddress(v74, 1);
        if (([v27 isEqual:v76] & 1) == 0)
        {
          v68 = v27;
          id v69 = v27;
          long long v28 = (const char *)[v69 UTF8String];
          CC_LONG v29 = strlen(v28);
          CC_SHA256(v28, v29, md);
          uint64_t v30 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];

          if (gLogCategory_CUAppleIDClient <= 30
            && (gLogCategory_CUAppleIDClient != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
          {
            LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Validating normalized peer hash: %@\n", v31, v32, v33, v34, v30);
          }
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          id v37 = v14;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v81 objects:v94 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v82;
LABEL_33:
            uint64_t v41 = 0;
            while (1)
            {
              if (*(void *)v82 != v40) {
                objc_enumerationMutation(v37);
              }
              long long v42 = *(void **)(*((void *)&v81 + 1) + 8 * v41);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v47 = NSDataWithHex((char *)[v42 UTF8String], -1, 22, 0, 0);
                if (gLogCategory_CUAppleIDClient <= 30
                  && (gLogCategory_CUAppleIDClient != -1
                   || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
                {
                  LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Attempting match against: %@\n", v43, v44, v45, v46, (uint64_t)v47);
                }
                char v48 = [v47 isEqual:v30];

                if (v48) {
                  break;
                }
              }
              if (v39 == ++v41)
              {
                uint64_t v39 = [v37 countByEnumeratingWithState:&v81 objects:v94 count:16];
                if (v39) {
                  goto LABEL_33;
                }
                goto LABEL_44;
              }
            }
LABEL_66:
            LODWORD(v35) = 1;
LABEL_67:
            id v36 = v69;
            goto LABEL_68;
          }
LABEL_44:

          uint64_t v11 = (void *)v30;
          uint64_t v26 = v74;
          id v27 = v68;
        }
      }
      else
      {
        uint64_t v26 = v74;
      }
      v49 = CUNormalizePhoneNumber(v26);
      if (v49)
      {
        id v36 = v49;
        v50 = (const char *)[v36 UTF8String];
        CC_LONG v51 = strlen(v50);
        CC_SHA256(v50, v51, md);
        uint64_t v30 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];

        if (gLogCategory_CUAppleIDClient <= 30
          && (gLogCategory_CUAppleIDClient != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Validating peer phone hash: %@\n", v52, v53, v54, v55, v30);
        }
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        CFTypeID v56 = CFArrayGetTypeID();
        CFDictionaryGetTypedValue(v73, @"ValidatedPhoneHashes", v56, 0);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = [v37 countByEnumeratingWithState:&v77 objects:v93 count:16];
        if (v35)
        {
          id v69 = v36;
          uint64_t v57 = *(void *)v78;
LABEL_54:
          uint64_t v58 = 0;
          while (1)
          {
            if (*(void *)v78 != v57) {
              objc_enumerationMutation(v37);
            }
            v59 = *(void **)(*((void *)&v77 + 1) + 8 * v58);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v64 = NSDataWithHex((char *)[v59 UTF8String], -1, 22, 0, 0);
              if (gLogCategory_CUAppleIDClient <= 30
                && (gLogCategory_CUAppleIDClient != -1
                 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
              {
                LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Attempting match against: %@\n", v60, v61, v62, v63, (uint64_t)v64);
              }
              char v65 = [v64 isEqual:v30];

              if (v65) {
                goto LABEL_66;
              }
            }
            if (v35 == ++v58)
            {
              uint64_t v35 = [v37 countByEnumeratingWithState:&v77 objects:v93 count:16];
              if (v35) {
                goto LABEL_54;
              }
              goto LABEL_67;
            }
          }
        }
LABEL_68:

        uint64_t v11 = (void *)v30;
        goto LABEL_69;
      }
      id v36 = 0;
      LODWORD(v35) = 0;
LABEL_69:

      if (v35)
      {
        BOOL v66 = 1;
        goto LABEL_74;
      }
      uint64_t v4 = v75 + 1;
      if (v75 + 1 == v72)
      {
        uint64_t v72 = [(NSArray *)obj countByEnumeratingWithState:&v89 objects:v97 count:16];
        if (v72) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  BOOL v66 = 0;
LABEL_74:

  return v66;
}

- (BOOL)validatePeerWithFlags:(unsigned int)a3 error:(id *)a4
{
  char v9 = a3;
  if (gLogCategory_CUAppleIDClient <= 30
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient validatePeerWithFlags:error:]", 0x1Eu, (uint64_t)"Validate peer\n", v4, v5, v6, v7, (uint64_t)v64);
  }
  if (self->_peerValidated) {
    return 1;
  }
  if (self->_peerSignatureVerified)
  {
    uint64_t v18 = self->_peerValidationData;
    if (!v18)
    {
      if (a4)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"No peer validation data", v12, v13, v14, v15, v16, v17, (uint64_t)v64);
        BOOL v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v11 = 0;
      }
      goto LABEL_52;
    }
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x3032000000;
    id v76 = __Block_byref_object_copy_;
    long long v77 = __Block_byref_object_dispose_;
    id v78 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    int v72 = 1;
    dispatch_queue_t v19 = dispatch_queue_create("SFAppleIDQueue", 0);
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __47__CUAppleIDClient_validatePeerWithFlags_error___block_invoke;
    v65[3] = &unk_1E55BD848;
    v67 = &v73;
    v68 = &v69;
    uint64_t v21 = v20;
    BOOL v66 = v21;
    ((void (*)(void *, void *, void *))softLinkSFAppleIDParseValidationRecordData[0])(v18, v19, v65);
    dispatch_time_t v22 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v21, v22))
    {
      if (a4)
      {
        uint64_t v29 = 4294960574;
LABEL_21:
        NSErrorWithOSStatusF(v29, (uint64_t)"Validate peer data failed", v23, v24, v25, v26, v27, v28, (uint64_t)v64);
        BOOL v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

        _Block_object_dispose(&v69, 8);
        _Block_object_dispose(&v73, 8);

LABEL_52:
        return v11;
      }
      goto LABEL_23;
    }
    unsigned int v30 = *((_DWORD *)v70 + 6);
    if (v30 || (uint64_t v31 = (void *)v74[5]) == 0)
    {
      if (a4)
      {
        if (v30) {
          uint64_t v29 = v30;
        }
        else {
          uint64_t v29 = 4294960596;
        }
        goto LABEL_21;
      }
LABEL_23:
      BOOL v11 = 0;
      goto LABEL_51;
    }
    objc_storeStrong((id *)&self->_peerValidationDict, v31);
    CFDictionaryRef v32 = (const __CFDictionary *)v74[5];
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t v40 = CFDictionaryGetTypedValue(v32, @"encDsID", TypeID, 0);
    if (v40)
    {
      uint64_t v41 = [(CUAppleIDClient *)self _getPeerCertificateAndReturnError:a4];
      if (v41)
      {
        v64 = 0;
        LODWORD(v42) = SecCertificateCopyCommonName(v41, (CFStringRef *)&v64);
        v49 = v64;
        if (v42 || !v64)
        {
          if (a4)
          {
            if (v42) {
              uint64_t v42 = v42;
            }
            else {
              uint64_t v42 = 4294960596;
            }
            uint64_t v62 = NSErrorWithOSStatusF(v42, (uint64_t)"Get peer certificate common name failed", v43, v44, v45, v46, v47, v48, (uint64_t)v64);
            goto LABEL_44;
          }
        }
        else if ([(__CFString *)v64 hasSuffix:v40])
        {
          if (v9)
          {
            BOOL v11 = 1;
            goto LABEL_49;
          }
          if ([(CUAppleIDClient *)self _validatePeerHashes:v74[5]])
          {
            BOOL v11 = 1;
            self->_peerValidated = 1;
LABEL_49:

            goto LABEL_50;
          }
          if (a4)
          {
            uint64_t v62 = NSErrorWithOSStatusF(4294960588, (uint64_t)"Peer AppleID not found in hashes", v56, v57, v58, v59, v60, v61, (uint64_t)v64);
            goto LABEL_44;
          }
        }
        else if (a4)
        {
          uint64_t v62 = NSErrorWithOSStatusF(4294960552, (uint64_t)"Certificate DSID doesn't match validation info DSID", v50, v51, v52, v53, v54, v55, (uint64_t)v64);
LABEL_44:
          BOOL v11 = 0;
          *a4 = v62;
          goto LABEL_49;
        }
        BOOL v11 = 0;
        goto LABEL_49;
      }
    }
    else if (a4)
    {
      NSErrorWithOSStatusF(4294960591, (uint64_t)"No peer validation info DSID", v34, v35, v36, v37, v38, v39, (uint64_t)v64);
      BOOL v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

      goto LABEL_51;
    }
    BOOL v11 = 0;
    goto LABEL_50;
  }
  if (!a4) {
    return 0;
  }
  NSErrorWithOSStatusF(4294960551, (uint64_t)"Signature not verified. Use verifyData irst", *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v64);
  BOOL v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return v11;
}

void __47__CUAppleIDClient_validatePeerWithFlags_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)signBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (gLogCategory_CUAppleIDClient <= 30
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient signBytes:length:error:]", 0x1Eu, (uint64_t)"Sign %zu bytes\n", (uint64_t)a5, v5, v6, v7, a4);
  }
  id v50 = 0;
  size_t sigLen = 0;
  id v12 = [(CUAppleIDClient *)self copyMyAppleIDAndReturnError:&v50];
  id v13 = v50;
  id v18 = v13;
  if (!v12) {
    goto LABEL_24;
  }
  id v49 = v13;
  dispatch_queue_t v19 = [(CUAppleIDClient *)self _getMyIdentityAndReturnError:&v49];
  id v20 = v49;

  if (!v19)
  {
    id v18 = v20;
    goto LABEL_24;
  }
  id v48 = v20;
  uint64_t v21 = [(CUAppleIDClient *)self _getMySecretKeyAndReturnError:&v48];
  id v18 = v48;

  if (!v21) {
    goto LABEL_24;
  }
  size_t BlockSize = SecKeyGetBlockSize(v21);
  size_t sigLen = BlockSize;
  if (BlockSize)
  {
    size_t v29 = BlockSize;
    unsigned int v30 = (uint8_t *)malloc_type_malloc(BlockSize, 0x362CB884uLL);
    if (v30)
    {
      uint64_t v31 = v30;
      long long v70 = 0u;
      uint64_t v71 = 0;
      long long v69 = 0u;
      long long v68 = 0u;
      long long v67 = 0u;
      long long v66 = 0u;
      long long v65 = 0u;
      long long v64 = 0u;
      long long v63 = 0u;
      long long v62 = 0u;
      long long v61 = 0u;
      long long v60 = 0u;
      long long v59 = 0u;
      long long v58 = 0u;
      long long v57 = 0u;
      long long v56 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v53 = _kCryptoHashDescriptor_SHA512;
      _SHA512Init((uint64_t)&v53);
      _SHA512Update((uint64_t)&v53, a3, a4);
      _SHA512Final((uint64_t)&v53, dataToSign);
      uint64_t v32 = SecKeyRawSign(v21, 1u, dataToSign, 0x40uLL, v31, &sigLen);
      if (v32)
      {
        uint64_t v46 = "Sign with AppleID failed";
      }
      else
      {
        id v39 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v40 = [v39 initWithBytesNoCopy:v31 length:sigLen];
        if (v40)
        {
          uint64_t v41 = (void *)v40;

          id v18 = 0;
          goto LABEL_13;
        }
        size_t v47 = sigLen;
        uint64_t v46 = "Alloc init AppleID signature failed (%zu bytes)";
        uint64_t v32 = 4294960568;
      }
      uint64_t v45 = NSErrorWithOSStatusF(v32, (uint64_t)v46, v33, v34, v35, v36, v37, v38, v47);

      free(v31);
      goto LABEL_23;
    }
    size_t v47 = v29;
    uint64_t v43 = "Malloc AppleID signature buffer failed (%zu bytes)";
    uint64_t v44 = 4294960568;
  }
  else
  {
    uint64_t v43 = "Get AppleID key size failed";
    uint64_t v44 = 4294960553;
  }
  uint64_t v45 = NSErrorWithOSStatusF(v44, (uint64_t)v43, v23, v24, v25, v26, v27, v28, v47);

LABEL_23:
  id v18 = (id)v45;
LABEL_24:
  if (v18
    && gLogCategory_CUAppleIDClient <= 60
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient signBytes:length:error:]", 0x3Cu, (uint64_t)"### Sign failed (%zu bytes): %{error}\n", v14, v15, v16, v17, a4);
  }
  if (a5)
  {
    id v18 = v18;
    uint64_t v41 = 0;
    *a5 = v18;
  }
  else
  {
    uint64_t v41 = 0;
  }
LABEL_13:

  return v41;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  return [(CUAppleIDClient *)self signBytes:v7 length:v8 error:a4];
}

- (void)setPeerAppleID:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_peerAppleID, a3);
  if (v5)
  {
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    peerAppleIDs = self->_peerAppleIDs;
    self->_peerAppleIDs = v6;
  }
  else
  {
    peerAppleIDs = self->_peerAppleIDs;
    self->_peerAppleIDs = 0;
  }
}

- (void)dealloc
{
  myCertificate = self->_myCertificate;
  if (myCertificate)
  {
    CFRelease(myCertificate);
    self->_myCertificate = 0;
  }
  myIdentity = self->_myIdentity;
  if (myIdentity)
  {
    CFRelease(myIdentity);
    self->_myIdentity = 0;
  }
  mySecretKey = self->_mySecretKey;
  if (mySecretKey)
  {
    CFRelease(mySecretKey);
    self->_mySecretKey = 0;
  }
  peerCertificate = self->_peerCertificate;
  if (peerCertificate)
  {
    CFRelease(peerCertificate);
    self->_peerCertificate = 0;
  }
  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey)
  {
    CFRelease(peerPublicKey);
    self->_peerPublicKey = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CUAppleIDClient;
  [(CUAppleIDClient *)&v8 dealloc];
}

@end