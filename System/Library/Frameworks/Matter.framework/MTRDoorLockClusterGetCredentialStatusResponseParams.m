@interface MTRDoorLockClusterGetCredentialStatusResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRDoorLockClusterGetCredentialStatusResponseParams)init;
- (MTRDoorLockClusterGetCredentialStatusResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSData)credentialData;
- (NSNumber)creatorFabricIndex;
- (NSNumber)credentialExists;
- (NSNumber)lastModifiedFabricIndex;
- (NSNumber)nextCredentialIndex;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)userIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCreatorFabricIndex:(NSNumber *)creatorFabricIndex;
- (void)setCredentialData:(id)a3;
- (void)setCredentialExists:(NSNumber *)credentialExists;
- (void)setLastModifiedFabricIndex:(NSNumber *)lastModifiedFabricIndex;
- (void)setNextCredentialIndex:(NSNumber *)nextCredentialIndex;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUserIndex:(NSNumber *)userIndex;
@end

@implementation MTRDoorLockClusterGetCredentialStatusResponseParams

- (MTRDoorLockClusterGetCredentialStatusResponseParams)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRDoorLockClusterGetCredentialStatusResponseParams;
  v2 = [(MTRDoorLockClusterGetCredentialStatusResponseParams *)&v12 init];
  v3 = v2;
  if (v2)
  {
    credentialExists = v2->_credentialExists;
    v2->_credentialExists = (NSNumber *)&unk_26F9C8548;

    userIndex = v3->_userIndex;
    v3->_userIndex = 0;

    creatorFabricIndex = v3->_creatorFabricIndex;
    v3->_creatorFabricIndex = 0;

    lastModifiedFabricIndex = v3->_lastModifiedFabricIndex;
    v3->_lastModifiedFabricIndex = 0;

    nextCredentialIndex = v3->_nextCredentialIndex;
    v3->_nextCredentialIndex = 0;

    credentialData = v3->_credentialData;
    v3->_credentialData = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterGetCredentialStatusResponseParams);
  v7 = objc_msgSend_credentialExists(self, v5, v6);
  objc_msgSend_setCredentialExists_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_userIndex(self, v9, v10);
  objc_msgSend_setUserIndex_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_creatorFabricIndex(self, v13, v14);
  objc_msgSend_setCreatorFabricIndex_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_lastModifiedFabricIndex(self, v17, v18);
  objc_msgSend_setLastModifiedFabricIndex_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_nextCredentialIndex(self, v21, v22);
  objc_msgSend_setNextCredentialIndex_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_credentialData(self, v25, v26);
  objc_msgSend_setCredentialData_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  credentialExists = self->_credentialExists;
  userIndex = self->_userIndex;
  creatorFabricIndex = self->_creatorFabricIndex;
  lastModifiedFabricIndex = self->_lastModifiedFabricIndex;
  nextCredentialIndex = self->_nextCredentialIndex;
  objc_super v12 = objc_msgSend_base64EncodedStringWithOptions_(self->_credentialData, v11, 0);
  objc_msgSend_stringWithFormat_(v3, v13, @"<%@: credentialExists:%@; userIndex:%@; creatorFabricIndex:%@; lastModifiedFabricIndex:%@; nextCredentialIndex:%@; credentialData:%@; >",
    v5,
    credentialExists,
    userIndex,
    creatorFabricIndex,
    lastModifiedFabricIndex,
    nextCredentialIndex,
  uint64_t v14 = v12);

  return v14;
}

- (MTRDoorLockClusterGetCredentialStatusResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRDoorLockClusterGetCredentialStatusResponseParams;
  v8 = [(MTRDoorLockClusterGetCredentialStatusResponseParams *)&v38 init];
  if (!v8)
  {
    uint64_t v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 257, 37, error);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      LOBYTE(buf) = 0;
      BYTE2(buf) = 0;
      BYTE4(buf) = 0;
      BYTE12(buf) = 0;
      LOBYTE(v42) = 0;
      *(_DWORD *)((char *)&buf + 6) = 0;
      BYTE10(buf) = 0;
      sub_244822248((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      long long v34 = v32;
      uint64_t v35 = v33;
      if (!v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        long long v34 = v32;
        uint64_t v35 = v33;
        if (!v32)
        {
          uint64_t v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    long long buf = v34;
    uint64_t v42 = v35;
    v11 = sub_244CB7B34((const char **)&buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    uint64_t v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = v13;
      uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v21 = v13;
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      uint64_t v39 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      uint64_t v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v30 = 0;
LABEL_14:
  sub_244794634(&v37);
LABEL_16:

  return v30;
}

- (NSNumber)credentialExists
{
  return self->_credentialExists;
}

- (void)setCredentialExists:(NSNumber *)credentialExists
{
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
}

- (NSNumber)creatorFabricIndex
{
  return self->_creatorFabricIndex;
}

- (void)setCreatorFabricIndex:(NSNumber *)creatorFabricIndex
{
}

- (NSNumber)lastModifiedFabricIndex
{
  return self->_lastModifiedFabricIndex;
}

- (void)setLastModifiedFabricIndex:(NSNumber *)lastModifiedFabricIndex
{
}

- (NSNumber)nextCredentialIndex
{
  return self->_nextCredentialIndex;
}

- (void)setNextCredentialIndex:(NSNumber *)nextCredentialIndex
{
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (void)setCredentialData:(id)a3
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_credentialData, 0);
  objc_storeStrong((id *)&self->_nextCredentialIndex, 0);
  objc_storeStrong((id *)&self->_lastModifiedFabricIndex, 0);
  objc_storeStrong((id *)&self->_creatorFabricIndex, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);

  objc_storeStrong((id *)&self->_credentialExists, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithBool_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setCredentialExists_(self, v8, (uint64_t)v7);

  if (*((unsigned char *)a4 + 4))
  {
    uint64_t v10 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v9, *((unsigned __int16 *)a4 + 1));
    objc_msgSend_setUserIndex_(self, v11, (uint64_t)v10);
  }
  else
  {
    objc_msgSend_setUserIndex_(self, v9, 0);
  }
  if (*((unsigned char *)a4 + 7))
  {
    v13 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v12, *((unsigned __int8 *)a4 + 6));
    objc_msgSend_setCreatorFabricIndex_(self, v14, (uint64_t)v13);
  }
  else
  {
    objc_msgSend_setCreatorFabricIndex_(self, v12, 0);
  }
  if (*((unsigned char *)a4 + 9))
  {
    v16 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v15, *((unsigned __int8 *)a4 + 8));
    objc_msgSend_setLastModifiedFabricIndex_(self, v17, (uint64_t)v16);
  }
  else
  {
    objc_msgSend_setLastModifiedFabricIndex_(self, v15, 0);
  }
  if (*((unsigned char *)a4 + 12))
  {
    v19 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v18, *((unsigned __int16 *)a4 + 5));
    objc_msgSend_setNextCredentialIndex_(self, v20, (uint64_t)v19);
  }
  else
  {
    objc_msgSend_setNextCredentialIndex_(self, v18, 0);
  }
  int v23 = *((unsigned __int8 *)a4 + 16);
  uint64_t v22 = (char *)a4 + 16;
  if (v23 && sub_2446F7170(v22)[16])
  {
    v24 = sub_2446F7170(v22);
    if (!v24[16]) {
      sub_24479484C();
    }
    uint64_t v26 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v25, *(void *)v24, *((void *)v24 + 1));
    objc_msgSend_setCredentialData_(self, v27, (uint64_t)v26);
  }
  else
  {
    result = (ChipError *)objc_msgSend_setCredentialData_(self, v21, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 21186;
  return result;
}

@end