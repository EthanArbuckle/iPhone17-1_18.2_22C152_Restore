@interface MTRDoorLockClusterSetCredentialParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDoorLockClusterCredentialStruct)credential;
- (MTRDoorLockClusterSetCredentialParams)init;
- (NSData)credentialData;
- (NSNumber)operationType;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)userIndex;
- (NSNumber)userStatus;
- (NSNumber)userType;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCredential:(MTRDoorLockClusterCredentialStruct *)credential;
- (void)setCredentialData:(NSData *)credentialData;
- (void)setOperationType:(NSNumber *)operationType;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUserIndex:(NSNumber *)userIndex;
- (void)setUserStatus:(NSNumber *)userStatus;
- (void)setUserType:(NSNumber *)userType;
@end

@implementation MTRDoorLockClusterSetCredentialParams

- (MTRDoorLockClusterSetCredentialParams)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTRDoorLockClusterSetCredentialParams;
  v2 = [(MTRDoorLockClusterSetCredentialParams *)&v17 init];
  v3 = v2;
  if (v2)
  {
    operationType = v2->_operationType;
    v2->_operationType = (NSNumber *)&unk_26F9C8548;

    uint64_t v5 = objc_opt_new();
    credential = v3->_credential;
    v3->_credential = (MTRDoorLockClusterCredentialStruct *)v5;

    uint64_t v9 = objc_msgSend_data(MEMORY[0x263EFF8F8], v7, v8);
    credentialData = v3->_credentialData;
    v3->_credentialData = (NSData *)v9;

    userIndex = v3->_userIndex;
    v3->_userIndex = 0;

    userStatus = v3->_userStatus;
    v3->_userStatus = 0;

    userType = v3->_userType;
    v3->_userType = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterSetCredentialParams);
  v7 = objc_msgSend_operationType(self, v5, v6);
  objc_msgSend_setOperationType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_credential(self, v9, v10);
  objc_msgSend_setCredential_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_credentialData(self, v13, v14);
  objc_msgSend_setCredentialData_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_userIndex(self, v17, v18);
  objc_msgSend_setUserIndex_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_userStatus(self, v21, v22);
  objc_msgSend_setUserStatus_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_userType(self, v25, v26);
  objc_msgSend_setUserType_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_serverSideProcessingTimeout(self, v33, v34);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v36, (uint64_t)v35);

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
  objc_msgSend_stringWithFormat_(v3, v10, @"<%@: operationType:%@; credential:%@; credentialData:%@; userIndex:%@; userStatus:%@; userType:%@; >",
    v5,
    operationType,
    credential,
    v9,
    self->_userIndex,
    self->_userStatus,
  v11 = self->_userType);

  return v11;
}

- (NSNumber)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(NSNumber *)operationType
{
}

- (MTRDoorLockClusterCredentialStruct)credential
{
  return self->_credential;
}

- (void)setCredential:(MTRDoorLockClusterCredentialStruct *)credential
{
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (void)setCredentialData:(NSData *)credentialData
{
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
}

- (NSNumber)userStatus
{
  return self->_userStatus;
}

- (void)setUserStatus:(NSNumber *)userStatus
{
}

- (NSNumber)userType
{
  return self->_userType;
}

- (void)setUserType:(NSNumber *)userType
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
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_userStatus, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_credentialData, 0);
  objc_storeStrong((id *)&self->_credential, 0);

  objc_storeStrong((id *)&self->_operationType, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  v64[0] = 0;
  char v65 = 0;
  __int16 v66 = 0;
  char v69 = 0;
  long long v67 = 0uLL;
  LOBYTE(v68) = 0;
  int v70 = 0;
  v63[0] = 0;
  v63[1] = 0;
  v62 = v63;
  v7 = objc_msgSend_operationType(self, a3, (uint64_t)a4);
  v64[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_credential(self, v10, v11);
  v15 = objc_msgSend_credentialType(v12, v13, v14);
  char v65 = objc_msgSend_unsignedCharValue(v15, v16, v17);

  v20 = objc_msgSend_credential(self, v18, v19);
  v23 = objc_msgSend_credentialIndex(v20, v21, v22);
  __int16 v66 = objc_msgSend_unsignedShortValue(v23, v24, v25);

  objc_msgSend_credentialData(self, v26, v27);
  id v28 = objc_claimAutoreleasedReturnValue();
  uint64_t v31 = objc_msgSend_bytes(v28, v29, v30);
  uint64_t v34 = objc_msgSend_length(v28, v32, v33);
  sub_2446C1098(v56, v31, v34);

  long long v67 = *(_OWORD *)v56;
  v37 = objc_msgSend_userIndex(self, v35, v36);

  if (v37)
  {
    __int16 v68 = 0;
    char v69 = 1;
    v40 = objc_msgSend_userIndex(self, v38, v39);
    __int16 v68 = objc_msgSend_unsignedShortValue(v40, v41, v42);
  }
  v43 = objc_msgSend_userStatus(self, v38, v39);

  if (v43)
  {
    LOWORD(v70) = 256;
    v46 = objc_msgSend_userStatus(self, v44, v45);
    LOBYTE(v70) = objc_msgSend_unsignedCharValue(v46, v47, v48);
  }
  v49 = objc_msgSend_userType(self, v44, v45);

  if (v49)
  {
    HIWORD(v70) = 256;
    v52 = objc_msgSend_userType(self, v50, v51);
    BYTE2(v70) = objc_msgSend_unsignedCharValue(v52, v53, v54);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v61);
  if (v61)
  {
    sub_244CB62B8((uint64_t)v56);
    v58 = 0;
    v59 = 0;
    v57 = &unk_26F9536C8;
    char v60 = 0;
    sub_2447945A0((uint64_t)&v57, &v61, 0);
    sub_244CB6318((uint64_t)v56, (uint64_t)&v57, 0xFFFFFFFF, (uint64_t)v71);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2448218F8((uint64_t)v64, v56, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v56, &v61, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v61);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v57 = &unk_26F9536C8;
    sub_244794634(&v59);
    sub_244794634(&v58);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 20839;
  }
  sub_244794634(&v61);
  return (ChipError *)sub_24479466C((uint64_t)&v62);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
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
    int v11 = 20868;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end