@interface MTRDoorLockClusterAppleSetAliroCredentialParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDoorLockClusterAppleAliroCredentialStruct)credential;
- (MTRDoorLockClusterAppleSetAliroCredentialParams)init;
- (NSData)credentialData;
- (NSNumber)operationType;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)userIndex;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCredential:(id)a3;
- (void)setCredentialData:(id)a3;
- (void)setOperationType:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setUserIndex:(id)a3;
@end

@implementation MTRDoorLockClusterAppleSetAliroCredentialParams

- (MTRDoorLockClusterAppleSetAliroCredentialParams)init
{
  v15.receiver = self;
  v15.super_class = (Class)MTRDoorLockClusterAppleSetAliroCredentialParams;
  v2 = [(MTRDoorLockClusterAppleSetAliroCredentialParams *)&v15 init];
  v3 = v2;
  if (v2)
  {
    operationType = v2->_operationType;
    v2->_operationType = (NSNumber *)&unk_26F9C8548;

    uint64_t v5 = objc_opt_new();
    credential = v3->_credential;
    v3->_credential = (MTRDoorLockClusterAppleAliroCredentialStruct *)v5;

    uint64_t v9 = objc_msgSend_data(MEMORY[0x263EFF8F8], v7, v8);
    credentialData = v3->_credentialData;
    v3->_credentialData = (NSData *)v9;

    userIndex = v3->_userIndex;
    v3->_userIndex = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterAppleSetAliroCredentialParams);
  v7 = objc_msgSend_operationType(self, v5, v6);
  objc_msgSend_setOperationType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_credential(self, v9, v10);
  objc_msgSend_setCredential_(v4, v12, (uint64_t)v11);

  objc_super v15 = objc_msgSend_credentialData(self, v13, v14);
  objc_msgSend_setCredentialData_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_userIndex(self, v17, v18);
  objc_msgSend_setUserIndex_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_serverSideProcessingTimeout(self, v25, v26);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  operationType = self->_operationType;
  credential = self->_credential;
  uint64_t v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_credentialData, v8, 0);
  objc_msgSend_stringWithFormat_(v3, v10, @"<%@: operationType:%@; credential:%@; credentialData:%@; userIndex:%@; >",
    v5,
    operationType,
    credential,
    v9,
  v11 = self->_userIndex);

  return v11;
}

- (NSNumber)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
}

- (MTRDoorLockClusterAppleAliroCredentialStruct)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (void)setCredentialData:(id)a3
{
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(id)a3
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
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_credentialData, 0);
  objc_storeStrong((id *)&self->_credential, 0);

  objc_storeStrong((id *)&self->_operationType, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  v49[0] = 0;
  char v50 = 0;
  __int16 v51 = 0;
  long long v52 = 0uLL;
  __int16 v53 = 0;
  v48[0] = 0;
  v48[1] = 0;
  v47 = v48;
  v7 = objc_msgSend_operationType(self, a3, (uint64_t)a4);
  v49[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_credential(self, v10, v11);
  objc_super v15 = objc_msgSend_credentialType(v12, v13, v14);
  char v50 = objc_msgSend_unsignedCharValue(v15, v16, v17);

  v20 = objc_msgSend_credential(self, v18, v19);
  v23 = objc_msgSend_credentialIndex(v20, v21, v22);
  __int16 v51 = objc_msgSend_unsignedShortValue(v23, v24, v25);

  objc_msgSend_credentialData(self, v26, v27);
  id v28 = objc_claimAutoreleasedReturnValue();
  uint64_t v31 = objc_msgSend_bytes(v28, v29, v30);
  uint64_t v34 = objc_msgSend_length(v28, v32, v33);
  sub_2446C1098(v41, v31, v34);

  long long v52 = *(_OWORD *)v41;
  v37 = objc_msgSend_userIndex(self, v35, v36);
  __int16 v53 = objc_msgSend_unsignedShortValue(v37, v38, v39);

  sub_244CC8F5C(0x62FuLL, 0, &v46);
  if (v46)
  {
    sub_244CB62B8((uint64_t)v41);
    v43 = 0;
    v44 = 0;
    v42 = &unk_26F9536C8;
    char v45 = 0;
    sub_2447945A0((uint64_t)&v42, &v46, 0);
    sub_244CB6318((uint64_t)v41, (uint64_t)&v42, 0xFFFFFFFF, (uint64_t)v54);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244822A58((uint64_t)v49, v41, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v41, &v46, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v46);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v42 = &unk_26F9536C8;
    sub_244794634(&v44);
    sub_244794634(&v43);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 98;
  }
  sub_244794634(&v46);
  return (ChipError *)sub_24479466C((uint64_t)&v47);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  objc_super v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  uint64_t v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 127;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end