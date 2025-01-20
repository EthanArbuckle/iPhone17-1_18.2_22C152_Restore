@interface MTRDoorLockClusterAppleClearAliroCredentialParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDoorLockClusterAppleAliroCredentialStruct)credential;
- (MTRDoorLockClusterAppleClearAliroCredentialParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCredential:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRDoorLockClusterAppleClearAliroCredentialParams

- (MTRDoorLockClusterAppleClearAliroCredentialParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRDoorLockClusterAppleClearAliroCredentialParams;
  v2 = [(MTRDoorLockClusterAppleClearAliroCredentialParams *)&v8 init];
  v3 = v2;
  if (v2)
  {
    credential = v2->_credential;
    v2->_credential = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterAppleClearAliroCredentialParams);
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
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: credential:%@ >", v5, self->_credential);;

  return v7;
}

- (MTRDoorLockClusterAppleAliroCredentialStruct)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
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
  LOBYTE(v33) = 0;
  char v34 = 0;
  v32[0] = 0;
  v32[1] = 0;
  v31 = v32;
  v7 = objc_msgSend_credential(self, a3, (uint64_t)a4);

  if (v7)
  {
    int v33 = 0;
    char v34 = 1;
    uint64_t v10 = objc_msgSend_credential(self, v8, v9);
    v13 = objc_msgSend_credentialType(v10, v11, v12);
    LOBYTE(v33) = objc_msgSend_unsignedCharValue(v13, v14, v15);

    v18 = objc_msgSend_credential(self, v16, v17);
    v21 = objc_msgSend_credentialIndex(v18, v19, v20);
    HIWORD(v33) = objc_msgSend_unsignedShortValue(v21, v22, v23);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v30);
  if (v30)
  {
    sub_244CB62B8((uint64_t)v25);
    v27 = 0;
    v28 = 0;
    v26 = &unk_26F9536C8;
    char v29 = 0;
    sub_2447945A0((uint64_t)&v26, &v30, 0);
    sub_244CB6318((uint64_t)v25, (uint64_t)&v26, 0xFFFFFFFF, (uint64_t)v35);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244822F0C(&v33, v25, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v25, &v30, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v30);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v26 = &unk_26F9536C8;
    sub_244794634(&v28);
    sub_244794634(&v27);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 263;
  }
  sub_244794634(&v30);
  return (ChipError *)sub_24479466C((uint64_t)&v31);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  uint64_t v15 = 0;
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
    int v11 = 292;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end