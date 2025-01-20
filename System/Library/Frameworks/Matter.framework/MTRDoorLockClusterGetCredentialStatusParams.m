@interface MTRDoorLockClusterGetCredentialStatusParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDoorLockClusterCredentialStruct)credential;
- (MTRDoorLockClusterGetCredentialStatusParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCredential:(MTRDoorLockClusterCredentialStruct *)credential;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRDoorLockClusterGetCredentialStatusParams

- (MTRDoorLockClusterGetCredentialStatusParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRDoorLockClusterGetCredentialStatusParams;
  v2 = [(MTRDoorLockClusterGetCredentialStatusParams *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    credential = v2->_credential;
    v2->_credential = (MTRDoorLockClusterCredentialStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterGetCredentialStatusParams);
  v7 = objc_msgSend_credential(self, v5, v6);
  objc_msgSend_setCredential_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_serverSideProcessingTimeout(self, v13, v14);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: credential:%@ >", v5, self->_credential);;

  return v7;
}

- (MTRDoorLockClusterCredentialStruct)credential
{
  return self->_credential;
}

- (void)setCredential:(MTRDoorLockClusterCredentialStruct *)credential
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);

  objc_storeStrong((id *)&self->_credential, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  v30[0] = 0;
  __int16 v31 = 0;
  v29[0] = 0;
  v29[1] = 0;
  v28 = v29;
  v7 = objc_msgSend_credential(self, a3, (uint64_t)a4);
  uint64_t v10 = objc_msgSend_credentialType(v7, v8, v9);
  v30[0] = objc_msgSend_unsignedCharValue(v10, v11, v12);

  v15 = objc_msgSend_credential(self, v13, v14);
  v18 = objc_msgSend_credentialIndex(v15, v16, v17);
  __int16 v31 = objc_msgSend_unsignedShortValue(v18, v19, v20);

  sub_244CC8F5C(0x62FuLL, 0, &v27);
  if (v27)
  {
    sub_244CB62B8((uint64_t)v22);
    v24 = 0;
    v25 = 0;
    v23 = &unk_26F9536C8;
    char v26 = 0;
    sub_2447945A0((uint64_t)&v23, &v27, 0);
    sub_244CB6318((uint64_t)v22, (uint64_t)&v23, 0xFFFFFFFF, (uint64_t)v32);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244821ECC(v30, v22, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v22, &v27, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v27);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v23 = &unk_26F9536C8;
    sub_244794634(&v25);
    sub_244794634(&v24);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 21020;
  }
  sub_244794634(&v27);
  return (ChipError *)sub_24479466C((uint64_t)&v28);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  objc_super v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 21049;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end