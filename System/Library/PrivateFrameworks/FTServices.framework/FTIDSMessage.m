@interface FTIDSMessage
- (BOOL)wantsBAASigning;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsBodySignature;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (BOOL)wantsIDSProtocolVersion;
- (BOOL)wantsIDSServer;
- (BOOL)wantsPushSignatures;
- (BOOL)wantsSignature;
- (FTIDSMessage)init;
- (NSData)IDCertificate;
- (NSData)pushCertificate;
- (NSData)pushToken;
- (NSMutableArray)certDataArray;
- (NSMutableArray)privateKeyArray;
- (NSMutableArray)publicKeyArray;
- (NSMutableArray)userIDArray;
- (NSString)selfURI;
- (__SecKey)identityPrivateKey;
- (__SecKey)identityPublicKey;
- (__SecKey)pushPrivateKey;
- (__SecKey)pushPublicKey;
- (id)additionalMessageHeaders;
- (id)additionalMessageHeadersForOutgoingPush;
- (id)copyWithZone:(_NSZone *)a3;
- (id)retryCountKey;
- (id)serverTimestamp;
- (id)serverTimestampReceivedDate;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)addAuthUserID:(id)a3 certificate:(id)a4 privateKey:(__SecKey *)a5 publicKey:(__SecKey *)a6;
- (void)dealloc;
- (void)setCertDataArray:(id)a3;
- (void)setIDCertificate:(id)a3;
- (void)setIdentityPrivateKey:(__SecKey *)a3;
- (void)setIdentityPublicKey:(__SecKey *)a3;
- (void)setPrivateKeyArray:(id)a3;
- (void)setPublicKeyArray:(id)a3;
- (void)setPushCertificate:(id)a3;
- (void)setPushPrivateKey:(__SecKey *)a3;
- (void)setPushPublicKey:(__SecKey *)a3;
- (void)setPushToken:(id)a3;
- (void)setSelfURI:(id)a3;
- (void)setServerTimestamp:(id)a3;
- (void)setServerTimestampReceivedDate:(id)a3;
- (void)setUserIDArray:(id)a3;
- (void)setWantsPushSignatures:(BOOL)a3;
@end

@implementation FTIDSMessage

- (FTIDSMessage)init
{
  v11.receiver = self;
  v11.super_class = (Class)FTIDSMessage;
  v2 = [(IDSBaseMessage *)&v11 init];
  if (v2)
  {
    IMGetConferenceSettings();
    id v3 = 0;
    v6 = objc_msgSend_lastObject(v3, v4, v5);
    objc_msgSend_setTopic_(v2, v7, (uint64_t)v6);

    objc_msgSend_setWantsResponse_(v2, v8, 1);
    objc_msgSend_setRetryCount_(v2, v9, (uint64_t)&unk_1EFE11BF8);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend_setPushPrivateKey_(self, a2, 0);
  objc_msgSend_setPushPublicKey_(self, v3, 0);
  objc_msgSend_setIdentityPrivateKey_(self, v4, 0);
  objc_msgSend_setIdentityPublicKey_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)FTIDSMessage;
  [(FTIDSMessage *)&v6 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v62.receiver = self;
  v62.super_class = (Class)FTIDSMessage;
  id v4 = [(IDSBaseMessage *)&v62 copyWithZone:a3];
  v7 = objc_msgSend_pushCertificate(self, v5, v6);
  objc_msgSend_setPushCertificate_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_pushPrivateKey(self, v9, v10);
  objc_msgSend_setPushPrivateKey_(v4, v12, v11);
  uint64_t v15 = objc_msgSend_pushPublicKey(self, v13, v14);
  objc_msgSend_setPushPublicKey_(v4, v16, v15);
  v19 = objc_msgSend_IDCertificate(self, v17, v18);
  objc_msgSend_setIDCertificate_(v4, v20, (uint64_t)v19);

  uint64_t v23 = objc_msgSend_identityPrivateKey(self, v21, v22);
  objc_msgSend_setIdentityPrivateKey_(v4, v24, v23);
  uint64_t v27 = objc_msgSend_identityPublicKey(self, v25, v26);
  objc_msgSend_setIdentityPublicKey_(v4, v28, v27);
  v31 = objc_msgSend_pushToken(self, v29, v30);
  objc_msgSend_setPushToken_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_selfURI(self, v33, v34);
  objc_msgSend_setSelfURI_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_publicKeyArray(self, v37, v38);
  objc_msgSend_setPublicKeyArray_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_privateKeyArray(self, v41, v42);
  objc_msgSend_setPrivateKeyArray_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_userIDArray(self, v45, v46);
  objc_msgSend_setUserIDArray_(v4, v48, (uint64_t)v47);

  v51 = objc_msgSend_certDataArray(self, v49, v50);
  objc_msgSend_setCertDataArray_(v4, v52, (uint64_t)v51);

  v55 = objc_msgSend_serverTimestamp(self, v53, v54);
  objc_msgSend_setServerTimestamp_(v4, v56, (uint64_t)v55);

  v59 = objc_msgSend_serverTimestampReceivedDate(self, v57, v58);
  objc_msgSend_setServerTimestampReceivedDate_(v4, v60, (uint64_t)v59);

  return v4;
}

- (void)setPushPublicKey:(__SecKey *)a3
{
  pushPublicKey = self->_pushPublicKey;
  if (pushPublicKey != a3)
  {
    if (pushPublicKey)
    {
      CFRelease(pushPublicKey);
      self->_pushPublicKey = 0;
    }
    if (a3)
    {
      self->_pushPublicKey = a3;
      CFRetain(a3);
    }
  }
}

- (void)setIdentityPrivateKey:(__SecKey *)a3
{
  identityKey = self->_identityKey;
  if (identityKey != a3)
  {
    if (identityKey)
    {
      CFRelease(identityKey);
      self->_identityKey = 0;
    }
    if (a3)
    {
      self->_identityKey = a3;
      CFRetain(a3);
    }
  }
}

- (void)setIdentityPublicKey:(__SecKey *)a3
{
  identityPublicKey = self->_identityPublicKey;
  if (identityPublicKey != a3)
  {
    if (identityPublicKey)
    {
      CFRelease(identityPublicKey);
      self->_identityPublicKey = 0;
    }
    if (a3)
    {
      self->_identityPublicKey = a3;
      CFRetain(a3);
    }
  }
}

- (void)setPushPrivateKey:(__SecKey *)a3
{
  pushKey = self->_pushKey;
  if (pushKey != a3)
  {
    if (pushKey)
    {
      CFRelease(pushKey);
      self->_pushKey = 0;
    }
    if (a3)
    {
      self->_pushKey = a3;
      CFRetain(a3);
    }
  }
}

- (void)addAuthUserID:(id)a3 certificate:(id)a4 privateKey:(__SecKey *)a5 publicKey:(__SecKey *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (objc_msgSend_length(v10, v12, v13) && (uint64_t v16 = objc_msgSend_length(v11, v14, v15), a6) && a5 && v16)
  {
    v19 = objc_msgSend_userIDArray(self, v17, v18);
    char v21 = objc_msgSend_containsObject_(v19, v20, (uint64_t)v10);

    if ((v21 & 1) == 0)
    {
      if (!self->_certDataArray)
      {
        uint64_t v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        certDataArray = self->_certDataArray;
        self->_certDataArray = v23;
      }
      if (!self->_userIDArray)
      {
        v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        userIDArray = self->_userIDArray;
        self->_userIDArray = v25;
      }
      if (!self->_publicKeyArray)
      {
        uint64_t v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        publicKeyArray = self->_publicKeyArray;
        self->_publicKeyArray = v27;
      }
      if (!self->_privateKeyArray)
      {
        v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        privateKeyArray = self->_privateKeyArray;
        self->_privateKeyArray = v29;
      }
      objc_msgSend_addObject_(self->_certDataArray, v22, (uint64_t)v11);
      objc_msgSend_addObject_(self->_userIDArray, v31, (uint64_t)v10);
      objc_msgSend_addObject_(self->_privateKeyArray, v32, (uint64_t)a5);
      objc_msgSend_addObject_(self->_publicKeyArray, v33, (uint64_t)a6);
    }
  }
  else
  {
    uint64_t v34 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v11;
      __int16 v39 = 2112;
      v40 = a6;
      __int16 v41 = 2112;
      uint64_t v42 = a5;
      _os_log_impl(&dword_1A7BC0000, v34, OS_LOG_TYPE_ERROR, "Passed in bogus info to FTIDSMessage (%@:%@:%@:%@)", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (BOOL)wantsBagKey
{
  return 1;
}

- (BOOL)wantsHTTPHeaders
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 1;
}

- (BOOL)wantsSignature
{
  return 1;
}

- (BOOL)wantsBodySignature
{
  return 1;
}

- (BOOL)wantsBAASigning
{
  return 1;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (BOOL)wantsIDSServer
{
  return 1;
}

- (BOOL)wantsIDSProtocolVersion
{
  return 1;
}

- (int64_t)command
{
  return 96;
}

- (int64_t)responseCommand
{
  return 97;
}

- (id)retryCountKey
{
  return @"retry-count";
}

- (id)additionalMessageHeaders
{
  v23.receiver = self;
  v23.super_class = (Class)FTIDSMessage;
  id v3 = [(IDSBaseMessage *)&v23 additionalMessageHeaders];
  Mutable = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5);

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  if ((objc_msgSend__usingOutgoingPush(self, v7, v8) & 1) == 0)
  {
    id v11 = objc_msgSend_pushToken(self, v9, v10);
    uint64_t v14 = objc_msgSend__FTStringFromBaseData(v11, v12, v13);

    if (v14) {
      CFDictionarySetValue(Mutable, @"x-push-token", v14);
    }
  }
  if (objc_msgSend_wantsIDSProtocolVersion(self, v9, v10))
  {
    v17 = _IDSIDProtocolVersionNumber();
    v20 = objc_msgSend_stringValue(v17, v18, v19);

    if (v20)
    {
      CFDictionarySetValue(Mutable, @"x-protocol-version", v20);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_1A7BFF1D4();
    }
  }
  char v21 = objc_msgSend_selfURI(self, v15, v16);
  if (v21) {
    CFDictionarySetValue(Mutable, @"x-id-self-uri", v21);
  }

  return Mutable;
}

- (id)additionalMessageHeadersForOutgoingPush
{
  v11.receiver = self;
  v11.super_class = (Class)FTIDSMessage;
  id v3 = [(IDSBaseMessage *)&v11 additionalMessageHeadersForOutgoingPush];
  Mutable = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5);

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  v9 = objc_msgSend_selfURI(self, v7, v8);
  if (v9) {
    CFDictionarySetValue(Mutable, @"x-id-self-uri", v9);
  }

  return Mutable;
}

- (NSData)pushCertificate
{
  return self->_pushCert;
}

- (void)setPushCertificate:(id)a3
{
}

- (__SecKey)identityPrivateKey
{
  return self->_identityKey;
}

- (NSData)IDCertificate
{
  return self->_identityCert;
}

- (void)setIDCertificate:(id)a3
{
}

- (__SecKey)identityPublicKey
{
  return self->_identityPublicKey;
}

- (__SecKey)pushPrivateKey
{
  return self->_pushKey;
}

- (__SecKey)pushPublicKey
{
  return self->_pushPublicKey;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)selfURI
{
  return self->_selfURI;
}

- (void)setSelfURI:(id)a3
{
}

- (NSMutableArray)certDataArray
{
  return self->_certDataArray;
}

- (void)setCertDataArray:(id)a3
{
}

- (NSMutableArray)publicKeyArray
{
  return self->_publicKeyArray;
}

- (void)setPublicKeyArray:(id)a3
{
}

- (NSMutableArray)privateKeyArray
{
  return self->_privateKeyArray;
}

- (void)setPrivateKeyArray:(id)a3
{
}

- (NSMutableArray)userIDArray
{
  return self->_userIDArray;
}

- (void)setUserIDArray:(id)a3
{
}

- (id)serverTimestamp
{
  return self->_serverTimestamp;
}

- (void)setServerTimestamp:(id)a3
{
}

- (id)serverTimestampReceivedDate
{
  return self->_serverTimestampReceivedDate;
}

- (void)setServerTimestampReceivedDate:(id)a3
{
}

- (BOOL)wantsPushSignatures
{
  return self->_wantsPushSignatures;
}

- (void)setWantsPushSignatures:(BOOL)a3
{
  self->_wantsPushSignatures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverTimestampReceivedDate, 0);
  objc_storeStrong((id *)&self->_serverTimestamp, 0);
  objc_storeStrong((id *)&self->_userIDArray, 0);
  objc_storeStrong((id *)&self->_privateKeyArray, 0);
  objc_storeStrong((id *)&self->_publicKeyArray, 0);
  objc_storeStrong((id *)&self->_certDataArray, 0);
  objc_storeStrong((id *)&self->_selfURI, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_identityCert, 0);

  objc_storeStrong((id *)&self->_pushCert, 0);
}

@end